#!/bin/bash
#SBATCH -j fenicsx_30
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1540
mpirun -n 32 python flow_past_cylinder.py --Re 1541
mpirun -n 32 python flow_past_cylinder.py --Re 1542
mpirun -n 32 python flow_past_cylinder.py --Re 1543
mpirun -n 32 python flow_past_cylinder.py --Re 1544
mpirun -n 32 python flow_past_cylinder.py --Re 1545
mpirun -n 32 python flow_past_cylinder.py --Re 1546
mpirun -n 32 python flow_past_cylinder.py --Re 1547
mpirun -n 32 python flow_past_cylinder.py --Re 1548
mpirun -n 32 python flow_past_cylinder.py --Re 1549
mpirun -n 32 python flow_past_cylinder.py --Re 1550
mpirun -n 32 python flow_past_cylinder.py --Re 1551
mpirun -n 32 python flow_past_cylinder.py --Re 1552
mpirun -n 32 python flow_past_cylinder.py --Re 1553
mpirun -n 32 python flow_past_cylinder.py --Re 1554
mpirun -n 32 python flow_past_cylinder.py --Re 1555
mpirun -n 32 python flow_past_cylinder.py --Re 1556
mpirun -n 32 python flow_past_cylinder.py --Re 1557
mpirun -n 32 python flow_past_cylinder.py --Re 1558
mpirun -n 32 python flow_past_cylinder.py --Re 1559
mpirun -n 32 python flow_past_cylinder.py --Re 1560
mpirun -n 32 python flow_past_cylinder.py --Re 1561
mpirun -n 32 python flow_past_cylinder.py --Re 1562
mpirun -n 32 python flow_past_cylinder.py --Re 1563
mpirun -n 32 python flow_past_cylinder.py --Re 1564
mpirun -n 32 python flow_past_cylinder.py --Re 1565
mpirun -n 32 python flow_past_cylinder.py --Re 1566
mpirun -n 32 python flow_past_cylinder.py --Re 1567
mpirun -n 32 python flow_past_cylinder.py --Re 1568
mpirun -n 32 python flow_past_cylinder.py --Re 1569
mpirun -n 32 python flow_past_cylinder.py --Re 1570
mpirun -n 32 python flow_past_cylinder.py --Re 1571
mpirun -n 32 python flow_past_cylinder.py --Re 1572
mpirun -n 32 python flow_past_cylinder.py --Re 1573
mpirun -n 32 python flow_past_cylinder.py --Re 1574
mpirun -n 32 python flow_past_cylinder.py --Re 1575
mpirun -n 32 python flow_past_cylinder.py --Re 1576
mpirun -n 32 python flow_past_cylinder.py --Re 1577
mpirun -n 32 python flow_past_cylinder.py --Re 1578
mpirun -n 32 python flow_past_cylinder.py --Re 1579
mpirun -n 32 python flow_past_cylinder.py --Re 1580
mpirun -n 32 python flow_past_cylinder.py --Re 1581
mpirun -n 32 python flow_past_cylinder.py --Re 1582
mpirun -n 32 python flow_past_cylinder.py --Re 1583
mpirun -n 32 python flow_past_cylinder.py --Re 1584
mpirun -n 32 python flow_past_cylinder.py --Re 1585
mpirun -n 32 python flow_past_cylinder.py --Re 1586
mpirun -n 32 python flow_past_cylinder.py --Re 1587
