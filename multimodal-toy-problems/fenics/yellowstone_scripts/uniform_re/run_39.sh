#!/bin/bash
#SBATCH -J fenicsx_39
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1972
python flow_past_cylinder.py --Re 1973
python flow_past_cylinder.py --Re 1974
python flow_past_cylinder.py --Re 1975
python flow_past_cylinder.py --Re 1976
python flow_past_cylinder.py --Re 1977
python flow_past_cylinder.py --Re 1978
python flow_past_cylinder.py --Re 1979
python flow_past_cylinder.py --Re 1980
python flow_past_cylinder.py --Re 1981
python flow_past_cylinder.py --Re 1982
python flow_past_cylinder.py --Re 1983
python flow_past_cylinder.py --Re 1984
python flow_past_cylinder.py --Re 1985
python flow_past_cylinder.py --Re 1986
python flow_past_cylinder.py --Re 1987
python flow_past_cylinder.py --Re 1988
python flow_past_cylinder.py --Re 1989
python flow_past_cylinder.py --Re 1990
python flow_past_cylinder.py --Re 1991
python flow_past_cylinder.py --Re 1992
python flow_past_cylinder.py --Re 1993
python flow_past_cylinder.py --Re 1994
python flow_past_cylinder.py --Re 1995
python flow_past_cylinder.py --Re 1996
python flow_past_cylinder.py --Re 1997
python flow_past_cylinder.py --Re 1998
python flow_past_cylinder.py --Re 1999
python flow_past_cylinder.py --Re 2000
