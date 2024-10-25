#!/bin/bash
#SBATCH -J fenicsx_19
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1012
mpirun -n 32 python flow_past_cylinder.py --Re 1013
mpirun -n 32 python flow_past_cylinder.py --Re 1014
mpirun -n 32 python flow_past_cylinder.py --Re 1015
mpirun -n 32 python flow_past_cylinder.py --Re 1016
mpirun -n 32 python flow_past_cylinder.py --Re 1017
mpirun -n 32 python flow_past_cylinder.py --Re 1018
mpirun -n 32 python flow_past_cylinder.py --Re 1019
mpirun -n 32 python flow_past_cylinder.py --Re 1020
mpirun -n 32 python flow_past_cylinder.py --Re 1021
mpirun -n 32 python flow_past_cylinder.py --Re 1022
mpirun -n 32 python flow_past_cylinder.py --Re 1023
mpirun -n 32 python flow_past_cylinder.py --Re 1024
mpirun -n 32 python flow_past_cylinder.py --Re 1025
mpirun -n 32 python flow_past_cylinder.py --Re 1026
mpirun -n 32 python flow_past_cylinder.py --Re 1027
mpirun -n 32 python flow_past_cylinder.py --Re 1028
mpirun -n 32 python flow_past_cylinder.py --Re 1029
mpirun -n 32 python flow_past_cylinder.py --Re 1030
mpirun -n 32 python flow_past_cylinder.py --Re 1031
mpirun -n 32 python flow_past_cylinder.py --Re 1032
mpirun -n 32 python flow_past_cylinder.py --Re 1033
mpirun -n 32 python flow_past_cylinder.py --Re 1034
mpirun -n 32 python flow_past_cylinder.py --Re 1035
mpirun -n 32 python flow_past_cylinder.py --Re 1036
mpirun -n 32 python flow_past_cylinder.py --Re 1037
mpirun -n 32 python flow_past_cylinder.py --Re 1038
mpirun -n 32 python flow_past_cylinder.py --Re 1039
mpirun -n 32 python flow_past_cylinder.py --Re 1040
mpirun -n 32 python flow_past_cylinder.py --Re 1041
mpirun -n 32 python flow_past_cylinder.py --Re 1042
mpirun -n 32 python flow_past_cylinder.py --Re 1043
mpirun -n 32 python flow_past_cylinder.py --Re 1044
mpirun -n 32 python flow_past_cylinder.py --Re 1045
mpirun -n 32 python flow_past_cylinder.py --Re 1046
mpirun -n 32 python flow_past_cylinder.py --Re 1047
mpirun -n 32 python flow_past_cylinder.py --Re 1048
mpirun -n 32 python flow_past_cylinder.py --Re 1049
mpirun -n 32 python flow_past_cylinder.py --Re 1050
mpirun -n 32 python flow_past_cylinder.py --Re 1051
mpirun -n 32 python flow_past_cylinder.py --Re 1052
mpirun -n 32 python flow_past_cylinder.py --Re 1053
mpirun -n 32 python flow_past_cylinder.py --Re 1054
mpirun -n 32 python flow_past_cylinder.py --Re 1055
mpirun -n 32 python flow_past_cylinder.py --Re 1056
mpirun -n 32 python flow_past_cylinder.py --Re 1057
mpirun -n 32 python flow_past_cylinder.py --Re 1058
mpirun -n 32 python flow_past_cylinder.py --Re 1059
