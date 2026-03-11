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

# Symlink for ngspice-36 include path resolution
if [ ! -L "sky130_fd_pr_models" ]; then
    ln -sf sky130_models/sky130_fd_pr_models sky130_fd_pr_models
    echo "Created sky130_fd_pr_models symlink"
fi

# Install Python packages system-wide
pip3 install --break-system-packages numpy pandas matplotlib scipy 2>/dev/null \
  || pip3 install numpy pandas matplotlib scipy 2>/dev/null \
  || echo "WARNING: pip install failed, try manually"

# .spiceinit in home dir
cp -f .spiceinit ~/. 2>/dev/null || true

echo "=== Verifying ngspice ==="
which ngspice && ngspice --version || echo "WARNING: ngspice not found in PATH"

echo "=== Verifying Python + numpy ==="
python3 -c "import numpy; print(f'numpy {numpy.__version__}')"

echo "=== Setup complete ==="
