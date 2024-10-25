#!/bin/bash
#SBATCH -J fenicsx_30
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1540
python flow_past_cylinder.py --Re 1541
python flow_past_cylinder.py --Re 1542
python flow_past_cylinder.py --Re 1543
python flow_past_cylinder.py --Re 1544
python flow_past_cylinder.py --Re 1545
python flow_past_cylinder.py --Re 1546
python flow_past_cylinder.py --Re 1547
python flow_past_cylinder.py --Re 1548
python flow_past_cylinder.py --Re 1549
python flow_past_cylinder.py --Re 1550
python flow_past_cylinder.py --Re 1551
python flow_past_cylinder.py --Re 1552
python flow_past_cylinder.py --Re 1553
python flow_past_cylinder.py --Re 1554
python flow_past_cylinder.py --Re 1555
python flow_past_cylinder.py --Re 1556
python flow_past_cylinder.py --Re 1557
python flow_past_cylinder.py --Re 1558
python flow_past_cylinder.py --Re 1559
python flow_past_cylinder.py --Re 1560
python flow_past_cylinder.py --Re 1561
python flow_past_cylinder.py --Re 1562
python flow_past_cylinder.py --Re 1563
python flow_past_cylinder.py --Re 1564
python flow_past_cylinder.py --Re 1565
python flow_past_cylinder.py --Re 1566
python flow_past_cylinder.py --Re 1567
python flow_past_cylinder.py --Re 1568
python flow_past_cylinder.py --Re 1569
python flow_past_cylinder.py --Re 1570
python flow_past_cylinder.py --Re 1571
python flow_past_cylinder.py --Re 1572
python flow_past_cylinder.py --Re 1573
python flow_past_cylinder.py --Re 1574
python flow_past_cylinder.py --Re 1575
python flow_past_cylinder.py --Re 1576
python flow_past_cylinder.py --Re 1577
python flow_past_cylinder.py --Re 1578
python flow_past_cylinder.py --Re 1579
python flow_past_cylinder.py --Re 1580
python flow_past_cylinder.py --Re 1581
python flow_past_cylinder.py --Re 1582
python flow_past_cylinder.py --Re 1583
python flow_past_cylinder.py --Re 1584
python flow_past_cylinder.py --Re 1585
python flow_past_cylinder.py --Re 1586
python flow_past_cylinder.py --Re 1587
