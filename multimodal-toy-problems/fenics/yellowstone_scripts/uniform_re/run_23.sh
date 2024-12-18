#!/bin/bash
#SBATCH -J fenicsx_23
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1204
python flow_past_cylinder.py --Re 1205
python flow_past_cylinder.py --Re 1206
python flow_past_cylinder.py --Re 1207
python flow_past_cylinder.py --Re 1208
python flow_past_cylinder.py --Re 1209
python flow_past_cylinder.py --Re 1210
python flow_past_cylinder.py --Re 1211
python flow_past_cylinder.py --Re 1212
python flow_past_cylinder.py --Re 1213
python flow_past_cylinder.py --Re 1214
python flow_past_cylinder.py --Re 1215
python flow_past_cylinder.py --Re 1216
python flow_past_cylinder.py --Re 1217
python flow_past_cylinder.py --Re 1218
python flow_past_cylinder.py --Re 1219
python flow_past_cylinder.py --Re 1220
python flow_past_cylinder.py --Re 1221
python flow_past_cylinder.py --Re 1222
python flow_past_cylinder.py --Re 1223
python flow_past_cylinder.py --Re 1224
python flow_past_cylinder.py --Re 1225
python flow_past_cylinder.py --Re 1226
python flow_past_cylinder.py --Re 1227
python flow_past_cylinder.py --Re 1228
python flow_past_cylinder.py --Re 1229
python flow_past_cylinder.py --Re 1230
python flow_past_cylinder.py --Re 1231
python flow_past_cylinder.py --Re 1232
python flow_past_cylinder.py --Re 1233
python flow_past_cylinder.py --Re 1234
python flow_past_cylinder.py --Re 1235
python flow_past_cylinder.py --Re 1236
python flow_past_cylinder.py --Re 1237
python flow_past_cylinder.py --Re 1238
python flow_past_cylinder.py --Re 1239
python flow_past_cylinder.py --Re 1240
python flow_past_cylinder.py --Re 1241
python flow_past_cylinder.py --Re 1242
python flow_past_cylinder.py --Re 1243
python flow_past_cylinder.py --Re 1244
python flow_past_cylinder.py --Re 1245
python flow_past_cylinder.py --Re 1246
python flow_past_cylinder.py --Re 1247
python flow_past_cylinder.py --Re 1248
python flow_past_cylinder.py --Re 1249
python flow_past_cylinder.py --Re 1250
python flow_past_cylinder.py --Re 1251
