#!/bin/bash
cd "$(dirname "$0")"
ITERATION=0
LOG="run_loop.log"
echo "=== SAR ADC Autoresearch Loop Started: $(date) ===" | tee -a "$LOG"
while true; do
    ITERATION=$((ITERATION + 1))
    echo "" | tee -a "$LOG"
    echo "=== ITERATION $ITERATION — $(date) ===" | tee -a "$LOG"
    PROMPT="You are an autonomous analog circuit designer. Read CLAUDE.md for your instructions.
Current iteration: $ITERATION
Do ONE complete iteration: analyze state, improve the design, evaluate, commit and push results."
    echo "$PROMPT" | claude --dangerously-skip-permissions 2>&1 | tee -a "$LOG"
    echo "Claude exited with code $? at $(date)" | tee -a "$LOG"
    sleep 5
done
