#!/bin/bash
#SBATCH -j fenicsx_39
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1972
mpirun -n 32 python flow_past_cylinder.py --Re 1973
mpirun -n 32 python flow_past_cylinder.py --Re 1974
mpirun -n 32 python flow_past_cylinder.py --Re 1975
mpirun -n 32 python flow_past_cylinder.py --Re 1976
mpirun -n 32 python flow_past_cylinder.py --Re 1977
mpirun -n 32 python flow_past_cylinder.py --Re 1978
mpirun -n 32 python flow_past_cylinder.py --Re 1979
mpirun -n 32 python flow_past_cylinder.py --Re 1980
mpirun -n 32 python flow_past_cylinder.py --Re 1981
mpirun -n 32 python flow_past_cylinder.py --Re 1982
mpirun -n 32 python flow_past_cylinder.py --Re 1983
mpirun -n 32 python flow_past_cylinder.py --Re 1984
mpirun -n 32 python flow_past_cylinder.py --Re 1985
mpirun -n 32 python flow_past_cylinder.py --Re 1986
mpirun -n 32 python flow_past_cylinder.py --Re 1987
mpirun -n 32 python flow_past_cylinder.py --Re 1988
mpirun -n 32 python flow_past_cylinder.py --Re 1989
mpirun -n 32 python flow_past_cylinder.py --Re 1990
mpirun -n 32 python flow_past_cylinder.py --Re 1991
mpirun -n 32 python flow_past_cylinder.py --Re 1992
mpirun -n 32 python flow_past_cylinder.py --Re 1993
mpirun -n 32 python flow_past_cylinder.py --Re 1994
mpirun -n 32 python flow_past_cylinder.py --Re 1995
mpirun -n 32 python flow_past_cylinder.py --Re 1996
mpirun -n 32 python flow_past_cylinder.py --Re 1997
mpirun -n 32 python flow_past_cylinder.py --Re 1998
mpirun -n 32 python flow_past_cylinder.py --Re 1999
mpirun -n 32 python flow_past_cylinder.py --Re 2000
