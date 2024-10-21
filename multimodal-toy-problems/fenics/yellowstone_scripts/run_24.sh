#!/bin/bash
#SBATCH -j fenicsx_24
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1252
mpirun -n 32 python flow_past_cylinder.py --Re 1253
mpirun -n 32 python flow_past_cylinder.py --Re 1254
mpirun -n 32 python flow_past_cylinder.py --Re 1255
mpirun -n 32 python flow_past_cylinder.py --Re 1256
mpirun -n 32 python flow_past_cylinder.py --Re 1257
mpirun -n 32 python flow_past_cylinder.py --Re 1258
mpirun -n 32 python flow_past_cylinder.py --Re 1259
mpirun -n 32 python flow_past_cylinder.py --Re 1260
mpirun -n 32 python flow_past_cylinder.py --Re 1261
mpirun -n 32 python flow_past_cylinder.py --Re 1262
mpirun -n 32 python flow_past_cylinder.py --Re 1263
mpirun -n 32 python flow_past_cylinder.py --Re 1264
mpirun -n 32 python flow_past_cylinder.py --Re 1265
mpirun -n 32 python flow_past_cylinder.py --Re 1266
mpirun -n 32 python flow_past_cylinder.py --Re 1267
mpirun -n 32 python flow_past_cylinder.py --Re 1268
mpirun -n 32 python flow_past_cylinder.py --Re 1269
mpirun -n 32 python flow_past_cylinder.py --Re 1270
mpirun -n 32 python flow_past_cylinder.py --Re 1271
mpirun -n 32 python flow_past_cylinder.py --Re 1272
mpirun -n 32 python flow_past_cylinder.py --Re 1273
mpirun -n 32 python flow_past_cylinder.py --Re 1274
mpirun -n 32 python flow_past_cylinder.py --Re 1275
mpirun -n 32 python flow_past_cylinder.py --Re 1276
mpirun -n 32 python flow_past_cylinder.py --Re 1277
mpirun -n 32 python flow_past_cylinder.py --Re 1278
mpirun -n 32 python flow_past_cylinder.py --Re 1279
mpirun -n 32 python flow_past_cylinder.py --Re 1280
mpirun -n 32 python flow_past_cylinder.py --Re 1281
mpirun -n 32 python flow_past_cylinder.py --Re 1282
mpirun -n 32 python flow_past_cylinder.py --Re 1283
mpirun -n 32 python flow_past_cylinder.py --Re 1284
mpirun -n 32 python flow_past_cylinder.py --Re 1285
mpirun -n 32 python flow_past_cylinder.py --Re 1286
mpirun -n 32 python flow_past_cylinder.py --Re 1287
mpirun -n 32 python flow_past_cylinder.py --Re 1288
mpirun -n 32 python flow_past_cylinder.py --Re 1289
mpirun -n 32 python flow_past_cylinder.py --Re 1290
mpirun -n 32 python flow_past_cylinder.py --Re 1291
mpirun -n 32 python flow_past_cylinder.py --Re 1292
mpirun -n 32 python flow_past_cylinder.py --Re 1293
mpirun -n 32 python flow_past_cylinder.py --Re 1294
mpirun -n 32 python flow_past_cylinder.py --Re 1295
mpirun -n 32 python flow_past_cylinder.py --Re 1296
mpirun -n 32 python flow_past_cylinder.py --Re 1297
mpirun -n 32 python flow_past_cylinder.py --Re 1298
mpirun -n 32 python flow_past_cylinder.py --Re 1299
