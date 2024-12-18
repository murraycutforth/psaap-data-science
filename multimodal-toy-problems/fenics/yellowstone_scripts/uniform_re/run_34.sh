#!/bin/bash
#SBATCH -J fenicsx_34
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1732
python flow_past_cylinder.py --Re 1733
python flow_past_cylinder.py --Re 1734
python flow_past_cylinder.py --Re 1735
python flow_past_cylinder.py --Re 1736
python flow_past_cylinder.py --Re 1737
python flow_past_cylinder.py --Re 1738
python flow_past_cylinder.py --Re 1739
python flow_past_cylinder.py --Re 1740
python flow_past_cylinder.py --Re 1741
python flow_past_cylinder.py --Re 1742
python flow_past_cylinder.py --Re 1743
python flow_past_cylinder.py --Re 1744
python flow_past_cylinder.py --Re 1745
python flow_past_cylinder.py --Re 1746
python flow_past_cylinder.py --Re 1747
python flow_past_cylinder.py --Re 1748
python flow_past_cylinder.py --Re 1749
python flow_past_cylinder.py --Re 1750
python flow_past_cylinder.py --Re 1751
python flow_past_cylinder.py --Re 1752
python flow_past_cylinder.py --Re 1753
python flow_past_cylinder.py --Re 1754
python flow_past_cylinder.py --Re 1755
python flow_past_cylinder.py --Re 1756
python flow_past_cylinder.py --Re 1757
python flow_past_cylinder.py --Re 1758
python flow_past_cylinder.py --Re 1759
python flow_past_cylinder.py --Re 1760
python flow_past_cylinder.py --Re 1761
python flow_past_cylinder.py --Re 1762
python flow_past_cylinder.py --Re 1763
python flow_past_cylinder.py --Re 1764
python flow_past_cylinder.py --Re 1765
python flow_past_cylinder.py --Re 1766
python flow_past_cylinder.py --Re 1767
python flow_past_cylinder.py --Re 1768
python flow_past_cylinder.py --Re 1769
python flow_past_cylinder.py --Re 1770
python flow_past_cylinder.py --Re 1771
python flow_past_cylinder.py --Re 1772
python flow_past_cylinder.py --Re 1773
python flow_past_cylinder.py --Re 1774
python flow_past_cylinder.py --Re 1775
python flow_past_cylinder.py --Re 1776
python flow_past_cylinder.py --Re 1777
python flow_past_cylinder.py --Re 1778
python flow_past_cylinder.py --Re 1779
