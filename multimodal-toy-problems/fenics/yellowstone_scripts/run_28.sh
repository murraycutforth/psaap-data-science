#!/bin/bash
#SBATCH -j fenicsx_28
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1444
mpirun -n 32 python flow_past_cylinder.py --Re 1445
mpirun -n 32 python flow_past_cylinder.py --Re 1446
mpirun -n 32 python flow_past_cylinder.py --Re 1447
mpirun -n 32 python flow_past_cylinder.py --Re 1448
mpirun -n 32 python flow_past_cylinder.py --Re 1449
mpirun -n 32 python flow_past_cylinder.py --Re 1450
mpirun -n 32 python flow_past_cylinder.py --Re 1451
mpirun -n 32 python flow_past_cylinder.py --Re 1452
mpirun -n 32 python flow_past_cylinder.py --Re 1453
mpirun -n 32 python flow_past_cylinder.py --Re 1454
mpirun -n 32 python flow_past_cylinder.py --Re 1455
mpirun -n 32 python flow_past_cylinder.py --Re 1456
mpirun -n 32 python flow_past_cylinder.py --Re 1457
mpirun -n 32 python flow_past_cylinder.py --Re 1458
mpirun -n 32 python flow_past_cylinder.py --Re 1459
mpirun -n 32 python flow_past_cylinder.py --Re 1460
mpirun -n 32 python flow_past_cylinder.py --Re 1461
mpirun -n 32 python flow_past_cylinder.py --Re 1462
mpirun -n 32 python flow_past_cylinder.py --Re 1463
mpirun -n 32 python flow_past_cylinder.py --Re 1464
mpirun -n 32 python flow_past_cylinder.py --Re 1465
mpirun -n 32 python flow_past_cylinder.py --Re 1466
mpirun -n 32 python flow_past_cylinder.py --Re 1467
mpirun -n 32 python flow_past_cylinder.py --Re 1468
mpirun -n 32 python flow_past_cylinder.py --Re 1469
mpirun -n 32 python flow_past_cylinder.py --Re 1470
mpirun -n 32 python flow_past_cylinder.py --Re 1471
mpirun -n 32 python flow_past_cylinder.py --Re 1472
mpirun -n 32 python flow_past_cylinder.py --Re 1473
mpirun -n 32 python flow_past_cylinder.py --Re 1474
mpirun -n 32 python flow_past_cylinder.py --Re 1475
mpirun -n 32 python flow_past_cylinder.py --Re 1476
mpirun -n 32 python flow_past_cylinder.py --Re 1477
mpirun -n 32 python flow_past_cylinder.py --Re 1478
mpirun -n 32 python flow_past_cylinder.py --Re 1479
mpirun -n 32 python flow_past_cylinder.py --Re 1480
mpirun -n 32 python flow_past_cylinder.py --Re 1481
mpirun -n 32 python flow_past_cylinder.py --Re 1482
mpirun -n 32 python flow_past_cylinder.py --Re 1483
mpirun -n 32 python flow_past_cylinder.py --Re 1484
mpirun -n 32 python flow_past_cylinder.py --Re 1485
mpirun -n 32 python flow_past_cylinder.py --Re 1486
mpirun -n 32 python flow_past_cylinder.py --Re 1487
mpirun -n 32 python flow_past_cylinder.py --Re 1488
mpirun -n 32 python flow_past_cylinder.py --Re 1489
mpirun -n 32 python flow_past_cylinder.py --Re 1490
mpirun -n 32 python flow_past_cylinder.py --Re 1491
