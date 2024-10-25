#!/bin/bash
#SBATCH -J fenicsx_28
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1444
python flow_past_cylinder.py --Re 1445
python flow_past_cylinder.py --Re 1446
python flow_past_cylinder.py --Re 1447
python flow_past_cylinder.py --Re 1448
python flow_past_cylinder.py --Re 1449
python flow_past_cylinder.py --Re 1450
python flow_past_cylinder.py --Re 1451
python flow_past_cylinder.py --Re 1452
python flow_past_cylinder.py --Re 1453
python flow_past_cylinder.py --Re 1454
python flow_past_cylinder.py --Re 1455
python flow_past_cylinder.py --Re 1456
python flow_past_cylinder.py --Re 1457
python flow_past_cylinder.py --Re 1458
python flow_past_cylinder.py --Re 1459
python flow_past_cylinder.py --Re 1460
python flow_past_cylinder.py --Re 1461
python flow_past_cylinder.py --Re 1462
python flow_past_cylinder.py --Re 1463
python flow_past_cylinder.py --Re 1464
python flow_past_cylinder.py --Re 1465
python flow_past_cylinder.py --Re 1466
python flow_past_cylinder.py --Re 1467
python flow_past_cylinder.py --Re 1468
python flow_past_cylinder.py --Re 1469
python flow_past_cylinder.py --Re 1470
python flow_past_cylinder.py --Re 1471
python flow_past_cylinder.py --Re 1472
python flow_past_cylinder.py --Re 1473
python flow_past_cylinder.py --Re 1474
python flow_past_cylinder.py --Re 1475
python flow_past_cylinder.py --Re 1476
python flow_past_cylinder.py --Re 1477
python flow_past_cylinder.py --Re 1478
python flow_past_cylinder.py --Re 1479
python flow_past_cylinder.py --Re 1480
python flow_past_cylinder.py --Re 1481
python flow_past_cylinder.py --Re 1482
python flow_past_cylinder.py --Re 1483
python flow_past_cylinder.py --Re 1484
python flow_past_cylinder.py --Re 1485
python flow_past_cylinder.py --Re 1486
python flow_past_cylinder.py --Re 1487
python flow_past_cylinder.py --Re 1488
python flow_past_cylinder.py --Re 1489
python flow_past_cylinder.py --Re 1490
python flow_past_cylinder.py --Re 1491
