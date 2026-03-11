# Autonomous Circuit Design — SAR ADC

You are an autonomous analog circuit designer. Your goal: design an 8-bit successive approximation (SAR) ADC that meets every specification in `specs.json` using the SKY130 foundry PDK.

You have Differential Evolution (DE) as your optimizer. You define topology and parameter ranges — DE finds optimal values. You NEVER set component values manually.

## Files

| File | Editable? | Purpose |
|------|-----------|---------|
| `design.cir` | YES | Parametric SPICE netlist |
| `parameters.csv` | YES | Parameter names, min, max for DE |
| `evaluate.py` | YES | Runs DE, measures, scores, plots |
| `specs.json` | **NO** | Target specifications |
| `program.md` | **NO** | These instructions |
| `de/engine.py` | **NO** | DE optimizer engine |
| `results.tsv` | YES | Experiment log — append after every run |

## Technology

- **PDK:** SkyWater SKY130 (130nm). Models: `.lib "sky130_models/sky130.lib.spice" tt`
- **Devices:** `sky130_fd_pr__nfet_01v8`, `sky130_fd_pr__pfet_01v8` (and LVT/HVT variants)
- **Instantiation:** `XM1 drain gate source bulk sky130_fd_pr__nfet_01v8 W=10u L=0.5u nf=1`
- **Supply:** 1.8V single supply. Nodes: `vdd` = 1.8V, `vss` = 0V
- **Units:** Always specify W and L with `u` suffix (micrometers). Capacitors with `p` or `f`.
- **ngspice settings:** `.spiceinit` must contain `set ngbehavior=hsa` and `set skywaterpdk`

## Architecture Overview

A SAR ADC consists of three main blocks. You are free to design each block however you choose:

1. **Comparator** — Compares the DAC output to the input. Can be a simple differential pair, a StrongARM latch, a double-tail comparator, etc. Speed and offset are critical.

2. **Capacitive DAC (CDAC)** — Binary-weighted or C-2C capacitor array. Performs sample-and-hold AND digital-to-analog conversion. Capacitor matching determines linearity.

3. **SAR Logic** — Generates the binary search sequence. In SPICE, this can be modeled behaviorally (voltage-controlled switches or `A` devices) since the digital logic is not the design challenge. The analog blocks are.

You may design and optimize these blocks individually or as a complete system. Start with the comparator and DAC — these are the analog heart. The SAR logic can be behavioral initially.

## Design Freedom

You are free to explore any SAR ADC architecture. Single-ended or differential input, binary-weighted or split-capacitor DAC, monotonic switching or conventional, bootstrapped sampling switch or simple CMOS switch — whatever you think will work. Experiment boldly.

The only constraints are physical reality:

1. **All values parametric.** Every W, L, resistor, capacitor, and bias current uses `{name}` in design.cir with a matching row in parameters.csv.
2. **Ranges must be physically real.** W: 0.5u–500u. L: 0.15u–10u. Caps: 10fF–50pF (unit cap typically 10–100fF for 8-bit). Resistors: 50Ω–500kΩ. Ranges must span at least 10× (one decade).
3. **No hardcoding to game the optimizer.** A range of [5.0, 5.001] is cheating. Every parameter must have real design freedom.
4. **No editing specs.json or model files.** You optimize the circuit to meet the specs, not the other way around.

## The Loop

### 1. Read current state
- `results.tsv` — what you've tried and how it scored
- `design.cir` + `parameters.csv` — current topology
- `specs.json` — what you're targeting

### 2. Design or modify the topology
Change whatever you think will improve performance. You can make small tweaks or try a completely different architecture. Your call.

### 3. Implement
- Edit `design.cir` with the new/modified circuit
- Update `parameters.csv` with ranges for all parameters
- Update `evaluate.py` if measurements need changes
- Verify every `{placeholder}` in design.cir has a parameters.csv entry

### 4. Commit topology
```bash
git add -A
git commit -m "topology: <what changed>"
git push
```
Commit ALL files so any commit can be cloned and understood standalone.

### 5. Run DE
```bash
python evaluate.py 2>&1 | tee run.log          # full run
python evaluate.py --quick 2>&1 | tee run.log   # quick sanity check
```

### 6. Validate — THIS IS MANDATORY

DE found numbers. Now prove they're real. **Do not skip any of these checks.**

#### a) Full-scale ramp test
Apply a slow ramp from 0V to 1.8V and capture all 256 output codes. Every code must appear (no missing codes = DNL < 1 LSB). The transfer curve should look like a staircase.

#### b) INL/DNL calculation
From the ramp test, compute DNL and INL for every code transition. DNL = (actual step width / ideal step width) - 1. INL = cumulative sum of DNL or endpoint fit. Both must meet spec.

#### c) Dynamic test (FFT)
Apply a sine wave near Nyquist/2 (e.g., fs/4). Capture at least 1024 output samples. Compute FFT. Measure SNDR from the spectrum. This tests the ADC under realistic dynamic conditions.

#### d) Comparator verification
Test the comparator alone with a slow ramp. It must resolve correctly for inputs as small as 1 LSB (≈7mV for 8-bit, 1.8V range). If the comparator has too much offset or is too slow, the whole ADC fails.

**Only after all four checks pass do you log the result.**

### 7. Generate plots and log results

#### a) Functional plots — `plots/`
Generate these plots every iteration (overwrite previous):
- **`transfer_curve.png`** — ADC output code vs input voltage (staircase). Annotate missing codes if any.
- **`inl_dnl.png`** — INL and DNL vs output code. Annotate max INL and max DNL.
- **`fft.png`** — Output spectrum from sine wave test. Annotate SNDR and SFDR.
- **`comparator.png`** — Comparator output vs differential input (if testing separately).

Use a dark theme. Label axes with units. Annotate key measurements directly on each plot.

#### b) Progress plot — `plots/progress.png`
Regenerate from `results.tsv` after every run:
- X axis: iteration number
- Y axis: best score so far
- Mark topology changes with vertical dashed lines
- Mark the point where all specs were first met

#### c) Log to results.tsv
Append one line:
```
<commit_hash>	<score>	<topology>	<specs_met>/<total>	<notes>
```

#### d) Commit and push everything
```bash
git add -A
git commit -m "results: <score> — <summary>"
git push
```
Every commit must include ALL files — source, parameters, plots, logs, measurements.

### 8. Decide next step
- Specs not met → analyze what's failing, change topology or ranges
- DE didn't converge → widen ranges or try different architecture
- Specs met → keep improving margins, then check stopping condition

## Stopping Condition

Track a counter: `steps_without_improvement`. After each run:
- If the best score improved → reset counter to 0
- If it did not improve → increment counter

**Stop when BOTH conditions are true:**
1. All specifications in `specs.json` are met (verified by ramp test and FFT)
2. `steps_without_improvement >= 50`

Until both conditions are met, keep iterating.

## Known Pitfalls

**Capacitor matching limits linearity.** For 8-bit, the unit capacitor must be large enough that mismatch < 0.5 LSB. In SKY130, MIM caps (`sky130_fd_pr__cap_mim_m3_1`) have ~0.5% matching for 50fF. Smaller caps have worse matching.

**Comparator offset eats dynamic range.** A comparator with 50mV offset wastes ~7 LSBs of an 8-bit ADC. Use auto-zeroing or design for low offset (large input pair, careful layout).

**SAR logic timing.** The comparator must resolve within one SAR clock period. If it's too slow, the next bit decision is based on an incorrect comparison. Budget time as: Tconversion = N × (Tcomparator + Tsettle_DAC).

**Sampling switch charge injection.** When the sampling switch opens, channel charge is injected onto the sampling cap. This creates a signal-dependent offset. Bottom-plate sampling or bootstrapped switches help.

**Simulation speed.** A full ADC simulation with 256+ conversions is slow. Start by validating the comparator and DAC separately, then combine. Use behavioral SAR logic initially — replace with transistor-level logic only when the analog blocks are solid.
