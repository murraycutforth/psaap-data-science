#!/bin/bash
#SBATCH -J fenicsx_21
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1108
python flow_past_cylinder.py --Re 1109
python flow_past_cylinder.py --Re 1110
python flow_past_cylinder.py --Re 1111
python flow_past_cylinder.py --Re 1112
python flow_past_cylinder.py --Re 1113
python flow_past_cylinder.py --Re 1114
python flow_past_cylinder.py --Re 1115
python flow_past_cylinder.py --Re 1116
python flow_past_cylinder.py --Re 1117
python flow_past_cylinder.py --Re 1118
python flow_past_cylinder.py --Re 1119
python flow_past_cylinder.py --Re 1120
python flow_past_cylinder.py --Re 1121
python flow_past_cylinder.py --Re 1122
python flow_past_cylinder.py --Re 1123
python flow_past_cylinder.py --Re 1124
python flow_past_cylinder.py --Re 1125
python flow_past_cylinder.py --Re 1126
python flow_past_cylinder.py --Re 1127
python flow_past_cylinder.py --Re 1128
python flow_past_cylinder.py --Re 1129
python flow_past_cylinder.py --Re 1130
python flow_past_cylinder.py --Re 1131
python flow_past_cylinder.py --Re 1132
python flow_past_cylinder.py --Re 1133
python flow_past_cylinder.py --Re 1134
python flow_past_cylinder.py --Re 1135
python flow_past_cylinder.py --Re 1136
python flow_past_cylinder.py --Re 1137
python flow_past_cylinder.py --Re 1138
python flow_past_cylinder.py --Re 1139
python flow_past_cylinder.py --Re 1140
python flow_past_cylinder.py --Re 1141
python flow_past_cylinder.py --Re 1142
python flow_past_cylinder.py --Re 1143
python flow_past_cylinder.py --Re 1144
python flow_past_cylinder.py --Re 1145
python flow_past_cylinder.py --Re 1146
python flow_past_cylinder.py --Re 1147
python flow_past_cylinder.py --Re 1148
python flow_past_cylinder.py --Re 1149
python flow_past_cylinder.py --Re 1150
python flow_past_cylinder.py --Re 1151
python flow_past_cylinder.py --Re 1152
python flow_past_cylinder.py --Re 1153
python flow_past_cylinder.py --Re 1154
python flow_past_cylinder.py --Re 1155
