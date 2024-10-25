#!/bin/bash
#SBATCH -J fenicsx_31
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1588
python flow_past_cylinder.py --Re 1589
python flow_past_cylinder.py --Re 1590
python flow_past_cylinder.py --Re 1591
python flow_past_cylinder.py --Re 1592
python flow_past_cylinder.py --Re 1593
python flow_past_cylinder.py --Re 1594
python flow_past_cylinder.py --Re 1595
python flow_past_cylinder.py --Re 1596
python flow_past_cylinder.py --Re 1597
python flow_past_cylinder.py --Re 1598
python flow_past_cylinder.py --Re 1599
python flow_past_cylinder.py --Re 1600
python flow_past_cylinder.py --Re 1601
python flow_past_cylinder.py --Re 1602
python flow_past_cylinder.py --Re 1603
python flow_past_cylinder.py --Re 1604
python flow_past_cylinder.py --Re 1605
python flow_past_cylinder.py --Re 1606
python flow_past_cylinder.py --Re 1607
python flow_past_cylinder.py --Re 1608
python flow_past_cylinder.py --Re 1609
python flow_past_cylinder.py --Re 1610
python flow_past_cylinder.py --Re 1611
python flow_past_cylinder.py --Re 1612
python flow_past_cylinder.py --Re 1613
python flow_past_cylinder.py --Re 1614
python flow_past_cylinder.py --Re 1615
python flow_past_cylinder.py --Re 1616
python flow_past_cylinder.py --Re 1617
python flow_past_cylinder.py --Re 1618
python flow_past_cylinder.py --Re 1619
python flow_past_cylinder.py --Re 1620
python flow_past_cylinder.py --Re 1621
python flow_past_cylinder.py --Re 1622
python flow_past_cylinder.py --Re 1623
python flow_past_cylinder.py --Re 1624
python flow_past_cylinder.py --Re 1625
python flow_past_cylinder.py --Re 1626
python flow_past_cylinder.py --Re 1627
python flow_past_cylinder.py --Re 1628
python flow_past_cylinder.py --Re 1629
python flow_past_cylinder.py --Re 1630
python flow_past_cylinder.py --Re 1631
python flow_past_cylinder.py --Re 1632
python flow_past_cylinder.py --Re 1633
python flow_past_cylinder.py --Re 1634
python flow_past_cylinder.py --Re 1635
