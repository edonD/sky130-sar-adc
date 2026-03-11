#!/bin/bash
# Setup SKY130 PDK models for ngspice simulation
# Run this once before first evaluation

set -e

echo "=== Setting up SKY130 PDK models ==="

# Clone lightweight model repo
if [ ! -d "sky130_models" ]; then
    git clone https://github.com/mkghub/skywater130_fd_pr_models.git sky130_models
    echo "Cloned SKY130 models"
else
    echo "sky130_models already exists, skipping clone"
fi

cd sky130_models

# The lib files reference 'sky130_fd_pr_models/' as prefix.
# Create mirror directory that maps to the repo root structure.
mkdir -p sky130_fd_pr_models

# Copy all subdirectories
for dir in cells corners parameters parasitics capacitors r+c file_tree; do
    if [ -d "$dir" ] && [ ! -d "sky130_fd_pr_models/$dir" ]; then
        cp -r "$dir" sky130_fd_pr_models/
    fi
done

# Copy all root-level spice files
cp -f *.spice sky130_fd_pr_models/ 2>/dev/null || true
cp -f *.model.spice sky130_fd_pr_models/ 2>/dev/null || true

# Comment out flash memory models (not in this lightweight repo)
sed -i 's|^\.include "sky130_fd_pr_models/sonos_|* .include "sky130_fd_pr_models/sonos_|' sky130_fd_pr_models/all.spice

cd ..

# Verify setup
if python3 -c "print('Python OK')" 2>/dev/null; then
    PYTHON=python3
else
    PYTHON=python
fi

echo "=== Verifying ngspice ==="
which ngspice && ngspice --version || echo "WARNING: ngspice not found in PATH"

echo "=== Verifying Python + numpy ==="
$PYTHON -c "import numpy; print(f'numpy {numpy.__version__}')"

echo "=== Setup complete ==="
