#!/bin/bash
#SBATCH -J fenicsx_25
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1300
mpirun -n 32 python flow_past_cylinder.py --Re 1301
mpirun -n 32 python flow_past_cylinder.py --Re 1302
mpirun -n 32 python flow_past_cylinder.py --Re 1303
mpirun -n 32 python flow_past_cylinder.py --Re 1304
mpirun -n 32 python flow_past_cylinder.py --Re 1305
mpirun -n 32 python flow_past_cylinder.py --Re 1306
mpirun -n 32 python flow_past_cylinder.py --Re 1307
mpirun -n 32 python flow_past_cylinder.py --Re 1308
mpirun -n 32 python flow_past_cylinder.py --Re 1309
mpirun -n 32 python flow_past_cylinder.py --Re 1310
mpirun -n 32 python flow_past_cylinder.py --Re 1311
mpirun -n 32 python flow_past_cylinder.py --Re 1312
mpirun -n 32 python flow_past_cylinder.py --Re 1313
mpirun -n 32 python flow_past_cylinder.py --Re 1314
mpirun -n 32 python flow_past_cylinder.py --Re 1315
mpirun -n 32 python flow_past_cylinder.py --Re 1316
mpirun -n 32 python flow_past_cylinder.py --Re 1317
mpirun -n 32 python flow_past_cylinder.py --Re 1318
mpirun -n 32 python flow_past_cylinder.py --Re 1319
mpirun -n 32 python flow_past_cylinder.py --Re 1320
mpirun -n 32 python flow_past_cylinder.py --Re 1321
mpirun -n 32 python flow_past_cylinder.py --Re 1322
mpirun -n 32 python flow_past_cylinder.py --Re 1323
mpirun -n 32 python flow_past_cylinder.py --Re 1324
mpirun -n 32 python flow_past_cylinder.py --Re 1325
mpirun -n 32 python flow_past_cylinder.py --Re 1326
mpirun -n 32 python flow_past_cylinder.py --Re 1327
mpirun -n 32 python flow_past_cylinder.py --Re 1328
mpirun -n 32 python flow_past_cylinder.py --Re 1329
mpirun -n 32 python flow_past_cylinder.py --Re 1330
mpirun -n 32 python flow_past_cylinder.py --Re 1331
mpirun -n 32 python flow_past_cylinder.py --Re 1332
mpirun -n 32 python flow_past_cylinder.py --Re 1333
mpirun -n 32 python flow_past_cylinder.py --Re 1334
mpirun -n 32 python flow_past_cylinder.py --Re 1335
mpirun -n 32 python flow_past_cylinder.py --Re 1336
mpirun -n 32 python flow_past_cylinder.py --Re 1337
mpirun -n 32 python flow_past_cylinder.py --Re 1338
mpirun -n 32 python flow_past_cylinder.py --Re 1339
mpirun -n 32 python flow_past_cylinder.py --Re 1340
mpirun -n 32 python flow_past_cylinder.py --Re 1341
mpirun -n 32 python flow_past_cylinder.py --Re 1342
mpirun -n 32 python flow_past_cylinder.py --Re 1343
mpirun -n 32 python flow_past_cylinder.py --Re 1344
mpirun -n 32 python flow_past_cylinder.py --Re 1345
mpirun -n 32 python flow_past_cylinder.py --Re 1346
mpirun -n 32 python flow_past_cylinder.py --Re 1347
