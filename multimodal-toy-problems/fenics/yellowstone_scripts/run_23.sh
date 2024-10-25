#!/bin/bash
#SBATCH -J fenicsx_23
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1204
mpirun -n 32 python flow_past_cylinder.py --Re 1205
mpirun -n 32 python flow_past_cylinder.py --Re 1206
mpirun -n 32 python flow_past_cylinder.py --Re 1207
mpirun -n 32 python flow_past_cylinder.py --Re 1208
mpirun -n 32 python flow_past_cylinder.py --Re 1209
mpirun -n 32 python flow_past_cylinder.py --Re 1210
mpirun -n 32 python flow_past_cylinder.py --Re 1211
mpirun -n 32 python flow_past_cylinder.py --Re 1212
mpirun -n 32 python flow_past_cylinder.py --Re 1213
mpirun -n 32 python flow_past_cylinder.py --Re 1214
mpirun -n 32 python flow_past_cylinder.py --Re 1215
mpirun -n 32 python flow_past_cylinder.py --Re 1216
mpirun -n 32 python flow_past_cylinder.py --Re 1217
mpirun -n 32 python flow_past_cylinder.py --Re 1218
mpirun -n 32 python flow_past_cylinder.py --Re 1219
mpirun -n 32 python flow_past_cylinder.py --Re 1220
mpirun -n 32 python flow_past_cylinder.py --Re 1221
mpirun -n 32 python flow_past_cylinder.py --Re 1222
mpirun -n 32 python flow_past_cylinder.py --Re 1223
mpirun -n 32 python flow_past_cylinder.py --Re 1224
mpirun -n 32 python flow_past_cylinder.py --Re 1225
mpirun -n 32 python flow_past_cylinder.py --Re 1226
mpirun -n 32 python flow_past_cylinder.py --Re 1227
mpirun -n 32 python flow_past_cylinder.py --Re 1228
mpirun -n 32 python flow_past_cylinder.py --Re 1229
mpirun -n 32 python flow_past_cylinder.py --Re 1230
mpirun -n 32 python flow_past_cylinder.py --Re 1231
mpirun -n 32 python flow_past_cylinder.py --Re 1232
mpirun -n 32 python flow_past_cylinder.py --Re 1233
mpirun -n 32 python flow_past_cylinder.py --Re 1234
mpirun -n 32 python flow_past_cylinder.py --Re 1235
mpirun -n 32 python flow_past_cylinder.py --Re 1236
mpirun -n 32 python flow_past_cylinder.py --Re 1237
mpirun -n 32 python flow_past_cylinder.py --Re 1238
mpirun -n 32 python flow_past_cylinder.py --Re 1239
mpirun -n 32 python flow_past_cylinder.py --Re 1240
mpirun -n 32 python flow_past_cylinder.py --Re 1241
mpirun -n 32 python flow_past_cylinder.py --Re 1242
mpirun -n 32 python flow_past_cylinder.py --Re 1243
mpirun -n 32 python flow_past_cylinder.py --Re 1244
mpirun -n 32 python flow_past_cylinder.py --Re 1245
mpirun -n 32 python flow_past_cylinder.py --Re 1246
mpirun -n 32 python flow_past_cylinder.py --Re 1247
mpirun -n 32 python flow_past_cylinder.py --Re 1248
mpirun -n 32 python flow_past_cylinder.py --Re 1249
mpirun -n 32 python flow_past_cylinder.py --Re 1250
mpirun -n 32 python flow_past_cylinder.py --Re 1251
