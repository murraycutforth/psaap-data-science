#!/bin/bash
#SBATCH -J fenicsx_24
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1252
python flow_past_cylinder.py --Re 1253
python flow_past_cylinder.py --Re 1254
python flow_past_cylinder.py --Re 1255
python flow_past_cylinder.py --Re 1256
python flow_past_cylinder.py --Re 1257
python flow_past_cylinder.py --Re 1258
python flow_past_cylinder.py --Re 1259
python flow_past_cylinder.py --Re 1260
python flow_past_cylinder.py --Re 1261
python flow_past_cylinder.py --Re 1262
python flow_past_cylinder.py --Re 1263
python flow_past_cylinder.py --Re 1264
python flow_past_cylinder.py --Re 1265
python flow_past_cylinder.py --Re 1266
python flow_past_cylinder.py --Re 1267
python flow_past_cylinder.py --Re 1268
python flow_past_cylinder.py --Re 1269
python flow_past_cylinder.py --Re 1270
python flow_past_cylinder.py --Re 1271
python flow_past_cylinder.py --Re 1272
python flow_past_cylinder.py --Re 1273
python flow_past_cylinder.py --Re 1274
python flow_past_cylinder.py --Re 1275
python flow_past_cylinder.py --Re 1276
python flow_past_cylinder.py --Re 1277
python flow_past_cylinder.py --Re 1278
python flow_past_cylinder.py --Re 1279
python flow_past_cylinder.py --Re 1280
python flow_past_cylinder.py --Re 1281
python flow_past_cylinder.py --Re 1282
python flow_past_cylinder.py --Re 1283
python flow_past_cylinder.py --Re 1284
python flow_past_cylinder.py --Re 1285
python flow_past_cylinder.py --Re 1286
python flow_past_cylinder.py --Re 1287
python flow_past_cylinder.py --Re 1288
python flow_past_cylinder.py --Re 1289
python flow_past_cylinder.py --Re 1290
python flow_past_cylinder.py --Re 1291
python flow_past_cylinder.py --Re 1292
python flow_past_cylinder.py --Re 1293
python flow_past_cylinder.py --Re 1294
python flow_past_cylinder.py --Re 1295
python flow_past_cylinder.py --Re 1296
python flow_past_cylinder.py --Re 1297
python flow_past_cylinder.py --Re 1298
python flow_past_cylinder.py --Re 1299
