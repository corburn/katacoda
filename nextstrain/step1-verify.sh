#!/bin/bash

# Check if the user installed snakemake as expected
source ~/.bashrc
conda activate snakemake && command -v snakemake && exit 0

# Check if the user installed snakemake by another means.
#command -v snakemake > /dev/null && exit 0
#find / -executable -type f -name snakemake
