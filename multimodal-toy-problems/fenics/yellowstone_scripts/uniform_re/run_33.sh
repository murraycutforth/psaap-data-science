#!/bin/bash
#SBATCH -J fenicsx_33
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1684
python flow_past_cylinder.py --Re 1685
python flow_past_cylinder.py --Re 1686
python flow_past_cylinder.py --Re 1687
python flow_past_cylinder.py --Re 1688
python flow_past_cylinder.py --Re 1689
python flow_past_cylinder.py --Re 1690
python flow_past_cylinder.py --Re 1691
python flow_past_cylinder.py --Re 1692
python flow_past_cylinder.py --Re 1693
python flow_past_cylinder.py --Re 1694
python flow_past_cylinder.py --Re 1695
python flow_past_cylinder.py --Re 1696
python flow_past_cylinder.py --Re 1697
python flow_past_cylinder.py --Re 1698
python flow_past_cylinder.py --Re 1699
python flow_past_cylinder.py --Re 1700
python flow_past_cylinder.py --Re 1701
python flow_past_cylinder.py --Re 1702
python flow_past_cylinder.py --Re 1703
python flow_past_cylinder.py --Re 1704
python flow_past_cylinder.py --Re 1705
python flow_past_cylinder.py --Re 1706
python flow_past_cylinder.py --Re 1707
python flow_past_cylinder.py --Re 1708
python flow_past_cylinder.py --Re 1709
python flow_past_cylinder.py --Re 1710
python flow_past_cylinder.py --Re 1711
python flow_past_cylinder.py --Re 1712
python flow_past_cylinder.py --Re 1713
python flow_past_cylinder.py --Re 1714
python flow_past_cylinder.py --Re 1715
python flow_past_cylinder.py --Re 1716
python flow_past_cylinder.py --Re 1717
python flow_past_cylinder.py --Re 1718
python flow_past_cylinder.py --Re 1719
python flow_past_cylinder.py --Re 1720
python flow_past_cylinder.py --Re 1721
python flow_past_cylinder.py --Re 1722
python flow_past_cylinder.py --Re 1723
python flow_past_cylinder.py --Re 1724
python flow_past_cylinder.py --Re 1725
python flow_past_cylinder.py --Re 1726
python flow_past_cylinder.py --Re 1727
python flow_past_cylinder.py --Re 1728
python flow_past_cylinder.py --Re 1729
python flow_past_cylinder.py --Re 1730
python flow_past_cylinder.py --Re 1731
