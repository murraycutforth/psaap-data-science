#!/bin/bash
#SBATCH -J fenicsx_32
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1636
python flow_past_cylinder.py --Re 1637
python flow_past_cylinder.py --Re 1638
python flow_past_cylinder.py --Re 1639
python flow_past_cylinder.py --Re 1640
python flow_past_cylinder.py --Re 1641
python flow_past_cylinder.py --Re 1642
python flow_past_cylinder.py --Re 1643
python flow_past_cylinder.py --Re 1644
python flow_past_cylinder.py --Re 1645
python flow_past_cylinder.py --Re 1646
python flow_past_cylinder.py --Re 1647
python flow_past_cylinder.py --Re 1648
python flow_past_cylinder.py --Re 1649
python flow_past_cylinder.py --Re 1650
python flow_past_cylinder.py --Re 1651
python flow_past_cylinder.py --Re 1652
python flow_past_cylinder.py --Re 1653
python flow_past_cylinder.py --Re 1654
python flow_past_cylinder.py --Re 1655
python flow_past_cylinder.py --Re 1656
python flow_past_cylinder.py --Re 1657
python flow_past_cylinder.py --Re 1658
python flow_past_cylinder.py --Re 1659
python flow_past_cylinder.py --Re 1660
python flow_past_cylinder.py --Re 1661
python flow_past_cylinder.py --Re 1662
python flow_past_cylinder.py --Re 1663
python flow_past_cylinder.py --Re 1664
python flow_past_cylinder.py --Re 1665
python flow_past_cylinder.py --Re 1666
python flow_past_cylinder.py --Re 1667
python flow_past_cylinder.py --Re 1668
python flow_past_cylinder.py --Re 1669
python flow_past_cylinder.py --Re 1670
python flow_past_cylinder.py --Re 1671
python flow_past_cylinder.py --Re 1672
python flow_past_cylinder.py --Re 1673
python flow_past_cylinder.py --Re 1674
python flow_past_cylinder.py --Re 1675
python flow_past_cylinder.py --Re 1676
python flow_past_cylinder.py --Re 1677
python flow_past_cylinder.py --Re 1678
python flow_past_cylinder.py --Re 1679
python flow_past_cylinder.py --Re 1680
python flow_past_cylinder.py --Re 1681
python flow_past_cylinder.py --Re 1682
python flow_past_cylinder.py --Re 1683
