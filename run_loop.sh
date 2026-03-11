#!/bin/bash
cd ~/sky130-sar-adc

while true; do
    echo "$(date): Starting new iteration..."

    PROMPT='You are an autonomous analog circuit design agent working on a SAR ADC in ~/sky130-sar-adc/.
Read the README.md, design.cir, results.tsv, and any existing code to understand the project state.

Do ONE complete experiment loop iteration:
1. Analyze previous results in results.tsv to decide what to try next
2. Modify design.cir with your chosen experiment
3. Run the simulation and evaluate results
4. Append results to results.tsv

After committing results, generate visualization artifacts:

Step A - Generate schematic:
  python3 ~/cir2sch/cir2sch.py design.cir plots/schematic.sch

Step B - Render schematic to SVG:
  xvfb-run -a xschem --command "after 1000 {xschem print svg '"$(pwd)"'/plots/schematic.svg; after 500 {exit 0}}" plots/schematic.sch

Step C - Generate progress plot from results.tsv:
  Create a Python script that reads results.tsv and plots the score over iterations using matplotlib, saving to plots/progress.png. The plot should show iteration number on x-axis, score on y-axis, with a title "SAR ADC Optimization Progress". Use a clear style with grid lines.

Step D - Commit and push everything:
  git add -A && git commit -m "results: <score> — <brief summary of what was tried>" && git push

Replace <score> with the actual score and <summary> with what you tried.
Be thorough but efficient. Make sure all commands succeed before moving on.'

    echo "$PROMPT" | claude --dangerously-skip-permissions

    echo "$(date): Iteration complete, sleeping 5s..."
    sleep 5
done
