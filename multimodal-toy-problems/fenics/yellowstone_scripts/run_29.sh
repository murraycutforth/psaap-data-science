#!/bin/bash
#SBATCH -j fenicsx_29
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1492
mpirun -n 32 python flow_past_cylinder.py --Re 1493
mpirun -n 32 python flow_past_cylinder.py --Re 1494
mpirun -n 32 python flow_past_cylinder.py --Re 1495
mpirun -n 32 python flow_past_cylinder.py --Re 1496
mpirun -n 32 python flow_past_cylinder.py --Re 1497
mpirun -n 32 python flow_past_cylinder.py --Re 1498
mpirun -n 32 python flow_past_cylinder.py --Re 1499
mpirun -n 32 python flow_past_cylinder.py --Re 1500
mpirun -n 32 python flow_past_cylinder.py --Re 1501
mpirun -n 32 python flow_past_cylinder.py --Re 1502
mpirun -n 32 python flow_past_cylinder.py --Re 1503
mpirun -n 32 python flow_past_cylinder.py --Re 1504
mpirun -n 32 python flow_past_cylinder.py --Re 1505
mpirun -n 32 python flow_past_cylinder.py --Re 1506
mpirun -n 32 python flow_past_cylinder.py --Re 1507
mpirun -n 32 python flow_past_cylinder.py --Re 1508
mpirun -n 32 python flow_past_cylinder.py --Re 1509
mpirun -n 32 python flow_past_cylinder.py --Re 1510
mpirun -n 32 python flow_past_cylinder.py --Re 1511
mpirun -n 32 python flow_past_cylinder.py --Re 1512
mpirun -n 32 python flow_past_cylinder.py --Re 1513
mpirun -n 32 python flow_past_cylinder.py --Re 1514
mpirun -n 32 python flow_past_cylinder.py --Re 1515
mpirun -n 32 python flow_past_cylinder.py --Re 1516
mpirun -n 32 python flow_past_cylinder.py --Re 1517
mpirun -n 32 python flow_past_cylinder.py --Re 1518
mpirun -n 32 python flow_past_cylinder.py --Re 1519
mpirun -n 32 python flow_past_cylinder.py --Re 1520
mpirun -n 32 python flow_past_cylinder.py --Re 1521
mpirun -n 32 python flow_past_cylinder.py --Re 1522
mpirun -n 32 python flow_past_cylinder.py --Re 1523
mpirun -n 32 python flow_past_cylinder.py --Re 1524
mpirun -n 32 python flow_past_cylinder.py --Re 1525
mpirun -n 32 python flow_past_cylinder.py --Re 1526
mpirun -n 32 python flow_past_cylinder.py --Re 1527
mpirun -n 32 python flow_past_cylinder.py --Re 1528
mpirun -n 32 python flow_past_cylinder.py --Re 1529
mpirun -n 32 python flow_past_cylinder.py --Re 1530
mpirun -n 32 python flow_past_cylinder.py --Re 1531
mpirun -n 32 python flow_past_cylinder.py --Re 1532
mpirun -n 32 python flow_past_cylinder.py --Re 1533
mpirun -n 32 python flow_past_cylinder.py --Re 1534
mpirun -n 32 python flow_past_cylinder.py --Re 1535
mpirun -n 32 python flow_past_cylinder.py --Re 1536
mpirun -n 32 python flow_past_cylinder.py --Re 1537
mpirun -n 32 python flow_past_cylinder.py --Re 1538
mpirun -n 32 python flow_past_cylinder.py --Re 1539
