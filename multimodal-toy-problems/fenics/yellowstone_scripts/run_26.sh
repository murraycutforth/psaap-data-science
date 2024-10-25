#!/bin/bash
#SBATCH -J fenicsx_26
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1348
python flow_past_cylinder.py --Re 1349
python flow_past_cylinder.py --Re 1350
python flow_past_cylinder.py --Re 1351
python flow_past_cylinder.py --Re 1352
python flow_past_cylinder.py --Re 1353
python flow_past_cylinder.py --Re 1354
python flow_past_cylinder.py --Re 1355
python flow_past_cylinder.py --Re 1356
python flow_past_cylinder.py --Re 1357
python flow_past_cylinder.py --Re 1358
python flow_past_cylinder.py --Re 1359
python flow_past_cylinder.py --Re 1360
python flow_past_cylinder.py --Re 1361
python flow_past_cylinder.py --Re 1362
python flow_past_cylinder.py --Re 1363
python flow_past_cylinder.py --Re 1364
python flow_past_cylinder.py --Re 1365
python flow_past_cylinder.py --Re 1366
python flow_past_cylinder.py --Re 1367
python flow_past_cylinder.py --Re 1368
python flow_past_cylinder.py --Re 1369
python flow_past_cylinder.py --Re 1370
python flow_past_cylinder.py --Re 1371
python flow_past_cylinder.py --Re 1372
python flow_past_cylinder.py --Re 1373
python flow_past_cylinder.py --Re 1374
python flow_past_cylinder.py --Re 1375
python flow_past_cylinder.py --Re 1376
python flow_past_cylinder.py --Re 1377
python flow_past_cylinder.py --Re 1378
python flow_past_cylinder.py --Re 1379
python flow_past_cylinder.py --Re 1380
python flow_past_cylinder.py --Re 1381
python flow_past_cylinder.py --Re 1382
python flow_past_cylinder.py --Re 1383
python flow_past_cylinder.py --Re 1384
python flow_past_cylinder.py --Re 1385
python flow_past_cylinder.py --Re 1386
python flow_past_cylinder.py --Re 1387
python flow_past_cylinder.py --Re 1388
python flow_past_cylinder.py --Re 1389
python flow_past_cylinder.py --Re 1390
python flow_past_cylinder.py --Re 1391
python flow_past_cylinder.py --Re 1392
python flow_past_cylinder.py --Re 1393
python flow_past_cylinder.py --Re 1394
python flow_past_cylinder.py --Re 1395
