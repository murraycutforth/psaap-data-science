#!/bin/bash

#sbatch -j fenicsx_debug               # job name
#sbatch -n 1                  # total number of nodes requested
#sbatch -t 1:00:00           # run time (hh:mm:ss)
#sbatch -p cpu

date

# activate python env
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env

# run main script
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 100

date
