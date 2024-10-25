#!/bin/bash
#SBATCH -J fenicsx_20
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1060
mpirun -n 32 python flow_past_cylinder.py --Re 1061
mpirun -n 32 python flow_past_cylinder.py --Re 1062
mpirun -n 32 python flow_past_cylinder.py --Re 1063
mpirun -n 32 python flow_past_cylinder.py --Re 1064
mpirun -n 32 python flow_past_cylinder.py --Re 1065
mpirun -n 32 python flow_past_cylinder.py --Re 1066
mpirun -n 32 python flow_past_cylinder.py --Re 1067
mpirun -n 32 python flow_past_cylinder.py --Re 1068
mpirun -n 32 python flow_past_cylinder.py --Re 1069
mpirun -n 32 python flow_past_cylinder.py --Re 1070
mpirun -n 32 python flow_past_cylinder.py --Re 1071
mpirun -n 32 python flow_past_cylinder.py --Re 1072
mpirun -n 32 python flow_past_cylinder.py --Re 1073
mpirun -n 32 python flow_past_cylinder.py --Re 1074
mpirun -n 32 python flow_past_cylinder.py --Re 1075
mpirun -n 32 python flow_past_cylinder.py --Re 1076
mpirun -n 32 python flow_past_cylinder.py --Re 1077
mpirun -n 32 python flow_past_cylinder.py --Re 1078
mpirun -n 32 python flow_past_cylinder.py --Re 1079
mpirun -n 32 python flow_past_cylinder.py --Re 1080
mpirun -n 32 python flow_past_cylinder.py --Re 1081
mpirun -n 32 python flow_past_cylinder.py --Re 1082
mpirun -n 32 python flow_past_cylinder.py --Re 1083
mpirun -n 32 python flow_past_cylinder.py --Re 1084
mpirun -n 32 python flow_past_cylinder.py --Re 1085
mpirun -n 32 python flow_past_cylinder.py --Re 1086
mpirun -n 32 python flow_past_cylinder.py --Re 1087
mpirun -n 32 python flow_past_cylinder.py --Re 1088
mpirun -n 32 python flow_past_cylinder.py --Re 1089
mpirun -n 32 python flow_past_cylinder.py --Re 1090
mpirun -n 32 python flow_past_cylinder.py --Re 1091
mpirun -n 32 python flow_past_cylinder.py --Re 1092
mpirun -n 32 python flow_past_cylinder.py --Re 1093
mpirun -n 32 python flow_past_cylinder.py --Re 1094
mpirun -n 32 python flow_past_cylinder.py --Re 1095
mpirun -n 32 python flow_past_cylinder.py --Re 1096
mpirun -n 32 python flow_past_cylinder.py --Re 1097
mpirun -n 32 python flow_past_cylinder.py --Re 1098
mpirun -n 32 python flow_past_cylinder.py --Re 1099
mpirun -n 32 python flow_past_cylinder.py --Re 1100
mpirun -n 32 python flow_past_cylinder.py --Re 1101
mpirun -n 32 python flow_past_cylinder.py --Re 1102
mpirun -n 32 python flow_past_cylinder.py --Re 1103
mpirun -n 32 python flow_past_cylinder.py --Re 1104
mpirun -n 32 python flow_past_cylinder.py --Re 1105
mpirun -n 32 python flow_past_cylinder.py --Re 1106
mpirun -n 32 python flow_past_cylinder.py --Re 1107
