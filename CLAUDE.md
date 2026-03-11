# SAR ADC Design Agent

Read these files before doing anything:
1. `program.md` — the full experiment loop, rules, and validation requirements
2. `specs.json` — target specifications (DO NOT MODIFY)
3. `design.cir` + `parameters.csv` — current state

## Key Rules
- Modify ONLY `design.cir`, `parameters.csv`, and `evaluate.py`
- NEVER edit `specs.json`, `program.md`, model files, or `de/engine.py`
- NEVER set parameter values — define ranges, let DE optimize
- NEVER declare success without full ramp test (all 256 codes) and FFT verification
- ALWAYS test comparator and DAC separately before full system simulation
- ALWAYS `git add -A && git push` so every commit is self-contained

## Commands
```bash
python evaluate.py 2>&1 | tee run.log          # full DE run
python evaluate.py --quick 2>&1 | tee run.log   # quick sanity check
```
