#!/bin/bash
#SBATCH -J fenicsx_31
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1588
mpirun -n 32 python flow_past_cylinder.py --Re 1589
mpirun -n 32 python flow_past_cylinder.py --Re 1590
mpirun -n 32 python flow_past_cylinder.py --Re 1591
mpirun -n 32 python flow_past_cylinder.py --Re 1592
mpirun -n 32 python flow_past_cylinder.py --Re 1593
mpirun -n 32 python flow_past_cylinder.py --Re 1594
mpirun -n 32 python flow_past_cylinder.py --Re 1595
mpirun -n 32 python flow_past_cylinder.py --Re 1596
mpirun -n 32 python flow_past_cylinder.py --Re 1597
mpirun -n 32 python flow_past_cylinder.py --Re 1598
mpirun -n 32 python flow_past_cylinder.py --Re 1599
mpirun -n 32 python flow_past_cylinder.py --Re 1600
mpirun -n 32 python flow_past_cylinder.py --Re 1601
mpirun -n 32 python flow_past_cylinder.py --Re 1602
mpirun -n 32 python flow_past_cylinder.py --Re 1603
mpirun -n 32 python flow_past_cylinder.py --Re 1604
mpirun -n 32 python flow_past_cylinder.py --Re 1605
mpirun -n 32 python flow_past_cylinder.py --Re 1606
mpirun -n 32 python flow_past_cylinder.py --Re 1607
mpirun -n 32 python flow_past_cylinder.py --Re 1608
mpirun -n 32 python flow_past_cylinder.py --Re 1609
mpirun -n 32 python flow_past_cylinder.py --Re 1610
mpirun -n 32 python flow_past_cylinder.py --Re 1611
mpirun -n 32 python flow_past_cylinder.py --Re 1612
mpirun -n 32 python flow_past_cylinder.py --Re 1613
mpirun -n 32 python flow_past_cylinder.py --Re 1614
mpirun -n 32 python flow_past_cylinder.py --Re 1615
mpirun -n 32 python flow_past_cylinder.py --Re 1616
mpirun -n 32 python flow_past_cylinder.py --Re 1617
mpirun -n 32 python flow_past_cylinder.py --Re 1618
mpirun -n 32 python flow_past_cylinder.py --Re 1619
mpirun -n 32 python flow_past_cylinder.py --Re 1620
mpirun -n 32 python flow_past_cylinder.py --Re 1621
mpirun -n 32 python flow_past_cylinder.py --Re 1622
mpirun -n 32 python flow_past_cylinder.py --Re 1623
mpirun -n 32 python flow_past_cylinder.py --Re 1624
mpirun -n 32 python flow_past_cylinder.py --Re 1625
mpirun -n 32 python flow_past_cylinder.py --Re 1626
mpirun -n 32 python flow_past_cylinder.py --Re 1627
mpirun -n 32 python flow_past_cylinder.py --Re 1628
mpirun -n 32 python flow_past_cylinder.py --Re 1629
mpirun -n 32 python flow_past_cylinder.py --Re 1630
mpirun -n 32 python flow_past_cylinder.py --Re 1631
mpirun -n 32 python flow_past_cylinder.py --Re 1632
mpirun -n 32 python flow_past_cylinder.py --Re 1633
mpirun -n 32 python flow_past_cylinder.py --Re 1634
mpirun -n 32 python flow_past_cylinder.py --Re 1635
