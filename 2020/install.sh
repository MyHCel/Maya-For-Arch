#!/bin/bash

# extract the compressed file

./scripts/extract.sh

# Install dependencies

./scripts/install_dep.sh

# Convert packages

./scripts/convert.sh

# Install all packages

./scripts/install_pkg.sh

#Make SSL and libGL symlinks

./scripts/symlink.sh

# adsklicensing

./scripts/adsk_licensing.sh

# Licensing

./scripts/licensing.sh

# Install Arnold (mtoa)

./scripts/mtoa.sh

# Execute Maya for the first time

echo "Sign in and close Maya after loading"

maya

# Fixing saving location and error messages

./scripts/fix.sh
