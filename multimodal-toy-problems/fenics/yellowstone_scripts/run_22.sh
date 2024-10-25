#!/bin/bash
#SBATCH -J fenicsx_22
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1156
python flow_past_cylinder.py --Re 1157
python flow_past_cylinder.py --Re 1158
python flow_past_cylinder.py --Re 1159
python flow_past_cylinder.py --Re 1160
python flow_past_cylinder.py --Re 1161
python flow_past_cylinder.py --Re 1162
python flow_past_cylinder.py --Re 1163
python flow_past_cylinder.py --Re 1164
python flow_past_cylinder.py --Re 1165
python flow_past_cylinder.py --Re 1166
python flow_past_cylinder.py --Re 1167
python flow_past_cylinder.py --Re 1168
python flow_past_cylinder.py --Re 1169
python flow_past_cylinder.py --Re 1170
python flow_past_cylinder.py --Re 1171
python flow_past_cylinder.py --Re 1172
python flow_past_cylinder.py --Re 1173
python flow_past_cylinder.py --Re 1174
python flow_past_cylinder.py --Re 1175
python flow_past_cylinder.py --Re 1176
python flow_past_cylinder.py --Re 1177
python flow_past_cylinder.py --Re 1178
python flow_past_cylinder.py --Re 1179
python flow_past_cylinder.py --Re 1180
python flow_past_cylinder.py --Re 1181
python flow_past_cylinder.py --Re 1182
python flow_past_cylinder.py --Re 1183
python flow_past_cylinder.py --Re 1184
python flow_past_cylinder.py --Re 1185
python flow_past_cylinder.py --Re 1186
python flow_past_cylinder.py --Re 1187
python flow_past_cylinder.py --Re 1188
python flow_past_cylinder.py --Re 1189
python flow_past_cylinder.py --Re 1190
python flow_past_cylinder.py --Re 1191
python flow_past_cylinder.py --Re 1192
python flow_past_cylinder.py --Re 1193
python flow_past_cylinder.py --Re 1194
python flow_past_cylinder.py --Re 1195
python flow_past_cylinder.py --Re 1196
python flow_past_cylinder.py --Re 1197
python flow_past_cylinder.py --Re 1198
python flow_past_cylinder.py --Re 1199
python flow_past_cylinder.py --Re 1200
python flow_past_cylinder.py --Re 1201
python flow_past_cylinder.py --Re 1202
python flow_past_cylinder.py --Re 1203
