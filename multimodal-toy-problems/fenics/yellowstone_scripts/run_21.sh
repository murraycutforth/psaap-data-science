#!/bin/bash
#SBATCH -J fenicsx_21
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1108
mpirun -n 32 python flow_past_cylinder.py --Re 1109
mpirun -n 32 python flow_past_cylinder.py --Re 1110
mpirun -n 32 python flow_past_cylinder.py --Re 1111
mpirun -n 32 python flow_past_cylinder.py --Re 1112
mpirun -n 32 python flow_past_cylinder.py --Re 1113
mpirun -n 32 python flow_past_cylinder.py --Re 1114
mpirun -n 32 python flow_past_cylinder.py --Re 1115
mpirun -n 32 python flow_past_cylinder.py --Re 1116
mpirun -n 32 python flow_past_cylinder.py --Re 1117
mpirun -n 32 python flow_past_cylinder.py --Re 1118
mpirun -n 32 python flow_past_cylinder.py --Re 1119
mpirun -n 32 python flow_past_cylinder.py --Re 1120
mpirun -n 32 python flow_past_cylinder.py --Re 1121
mpirun -n 32 python flow_past_cylinder.py --Re 1122
mpirun -n 32 python flow_past_cylinder.py --Re 1123
mpirun -n 32 python flow_past_cylinder.py --Re 1124
mpirun -n 32 python flow_past_cylinder.py --Re 1125
mpirun -n 32 python flow_past_cylinder.py --Re 1126
mpirun -n 32 python flow_past_cylinder.py --Re 1127
mpirun -n 32 python flow_past_cylinder.py --Re 1128
mpirun -n 32 python flow_past_cylinder.py --Re 1129
mpirun -n 32 python flow_past_cylinder.py --Re 1130
mpirun -n 32 python flow_past_cylinder.py --Re 1131
mpirun -n 32 python flow_past_cylinder.py --Re 1132
mpirun -n 32 python flow_past_cylinder.py --Re 1133
mpirun -n 32 python flow_past_cylinder.py --Re 1134
mpirun -n 32 python flow_past_cylinder.py --Re 1135
mpirun -n 32 python flow_past_cylinder.py --Re 1136
mpirun -n 32 python flow_past_cylinder.py --Re 1137
mpirun -n 32 python flow_past_cylinder.py --Re 1138
mpirun -n 32 python flow_past_cylinder.py --Re 1139
mpirun -n 32 python flow_past_cylinder.py --Re 1140
mpirun -n 32 python flow_past_cylinder.py --Re 1141
mpirun -n 32 python flow_past_cylinder.py --Re 1142
mpirun -n 32 python flow_past_cylinder.py --Re 1143
mpirun -n 32 python flow_past_cylinder.py --Re 1144
mpirun -n 32 python flow_past_cylinder.py --Re 1145
mpirun -n 32 python flow_past_cylinder.py --Re 1146
mpirun -n 32 python flow_past_cylinder.py --Re 1147
mpirun -n 32 python flow_past_cylinder.py --Re 1148
mpirun -n 32 python flow_past_cylinder.py --Re 1149
mpirun -n 32 python flow_past_cylinder.py --Re 1150
mpirun -n 32 python flow_past_cylinder.py --Re 1151
mpirun -n 32 python flow_past_cylinder.py --Re 1152
mpirun -n 32 python flow_past_cylinder.py --Re 1153
mpirun -n 32 python flow_past_cylinder.py --Re 1154
mpirun -n 32 python flow_past_cylinder.py --Re 1155
