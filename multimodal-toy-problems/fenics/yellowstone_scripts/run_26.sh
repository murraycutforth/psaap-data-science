#!/bin/bash
#SBATCH -J fenicsx_26
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1348
mpirun -n 32 python flow_past_cylinder.py --Re 1349
mpirun -n 32 python flow_past_cylinder.py --Re 1350
mpirun -n 32 python flow_past_cylinder.py --Re 1351
mpirun -n 32 python flow_past_cylinder.py --Re 1352
mpirun -n 32 python flow_past_cylinder.py --Re 1353
mpirun -n 32 python flow_past_cylinder.py --Re 1354
mpirun -n 32 python flow_past_cylinder.py --Re 1355
mpirun -n 32 python flow_past_cylinder.py --Re 1356
mpirun -n 32 python flow_past_cylinder.py --Re 1357
mpirun -n 32 python flow_past_cylinder.py --Re 1358
mpirun -n 32 python flow_past_cylinder.py --Re 1359
mpirun -n 32 python flow_past_cylinder.py --Re 1360
mpirun -n 32 python flow_past_cylinder.py --Re 1361
mpirun -n 32 python flow_past_cylinder.py --Re 1362
mpirun -n 32 python flow_past_cylinder.py --Re 1363
mpirun -n 32 python flow_past_cylinder.py --Re 1364
mpirun -n 32 python flow_past_cylinder.py --Re 1365
mpirun -n 32 python flow_past_cylinder.py --Re 1366
mpirun -n 32 python flow_past_cylinder.py --Re 1367
mpirun -n 32 python flow_past_cylinder.py --Re 1368
mpirun -n 32 python flow_past_cylinder.py --Re 1369
mpirun -n 32 python flow_past_cylinder.py --Re 1370
mpirun -n 32 python flow_past_cylinder.py --Re 1371
mpirun -n 32 python flow_past_cylinder.py --Re 1372
mpirun -n 32 python flow_past_cylinder.py --Re 1373
mpirun -n 32 python flow_past_cylinder.py --Re 1374
mpirun -n 32 python flow_past_cylinder.py --Re 1375
mpirun -n 32 python flow_past_cylinder.py --Re 1376
mpirun -n 32 python flow_past_cylinder.py --Re 1377
mpirun -n 32 python flow_past_cylinder.py --Re 1378
mpirun -n 32 python flow_past_cylinder.py --Re 1379
mpirun -n 32 python flow_past_cylinder.py --Re 1380
mpirun -n 32 python flow_past_cylinder.py --Re 1381
mpirun -n 32 python flow_past_cylinder.py --Re 1382
mpirun -n 32 python flow_past_cylinder.py --Re 1383
mpirun -n 32 python flow_past_cylinder.py --Re 1384
mpirun -n 32 python flow_past_cylinder.py --Re 1385
mpirun -n 32 python flow_past_cylinder.py --Re 1386
mpirun -n 32 python flow_past_cylinder.py --Re 1387
mpirun -n 32 python flow_past_cylinder.py --Re 1388
mpirun -n 32 python flow_past_cylinder.py --Re 1389
mpirun -n 32 python flow_past_cylinder.py --Re 1390
mpirun -n 32 python flow_past_cylinder.py --Re 1391
mpirun -n 32 python flow_past_cylinder.py --Re 1392
mpirun -n 32 python flow_past_cylinder.py --Re 1393
mpirun -n 32 python flow_past_cylinder.py --Re 1394
mpirun -n 32 python flow_past_cylinder.py --Re 1395
