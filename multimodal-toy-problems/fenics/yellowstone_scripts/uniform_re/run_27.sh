#!/bin/bash
#SBATCH -J fenicsx_27
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1396
python flow_past_cylinder.py --Re 1397
python flow_past_cylinder.py --Re 1398
python flow_past_cylinder.py --Re 1399
python flow_past_cylinder.py --Re 1400
python flow_past_cylinder.py --Re 1401
python flow_past_cylinder.py --Re 1402
python flow_past_cylinder.py --Re 1403
python flow_past_cylinder.py --Re 1404
python flow_past_cylinder.py --Re 1405
python flow_past_cylinder.py --Re 1406
python flow_past_cylinder.py --Re 1407
python flow_past_cylinder.py --Re 1408
python flow_past_cylinder.py --Re 1409
python flow_past_cylinder.py --Re 1410
python flow_past_cylinder.py --Re 1411
python flow_past_cylinder.py --Re 1412
python flow_past_cylinder.py --Re 1413
python flow_past_cylinder.py --Re 1414
python flow_past_cylinder.py --Re 1415
python flow_past_cylinder.py --Re 1416
python flow_past_cylinder.py --Re 1417
python flow_past_cylinder.py --Re 1418
python flow_past_cylinder.py --Re 1419
python flow_past_cylinder.py --Re 1420
python flow_past_cylinder.py --Re 1421
python flow_past_cylinder.py --Re 1422
python flow_past_cylinder.py --Re 1423
python flow_past_cylinder.py --Re 1424
python flow_past_cylinder.py --Re 1425
python flow_past_cylinder.py --Re 1426
python flow_past_cylinder.py --Re 1427
python flow_past_cylinder.py --Re 1428
python flow_past_cylinder.py --Re 1429
python flow_past_cylinder.py --Re 1430
python flow_past_cylinder.py --Re 1431
python flow_past_cylinder.py --Re 1432
python flow_past_cylinder.py --Re 1433
python flow_past_cylinder.py --Re 1434
python flow_past_cylinder.py --Re 1435
python flow_past_cylinder.py --Re 1436
python flow_past_cylinder.py --Re 1437
python flow_past_cylinder.py --Re 1438
python flow_past_cylinder.py --Re 1439
python flow_past_cylinder.py --Re 1440
python flow_past_cylinder.py --Re 1441
python flow_past_cylinder.py --Re 1442
python flow_past_cylinder.py --Re 1443
