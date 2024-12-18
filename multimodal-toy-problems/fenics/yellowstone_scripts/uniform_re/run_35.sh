#!/bin/bash
#SBATCH -J fenicsx_35
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1780
python flow_past_cylinder.py --Re 1781
python flow_past_cylinder.py --Re 1782
python flow_past_cylinder.py --Re 1783
python flow_past_cylinder.py --Re 1784
python flow_past_cylinder.py --Re 1785
python flow_past_cylinder.py --Re 1786
python flow_past_cylinder.py --Re 1787
python flow_past_cylinder.py --Re 1788
python flow_past_cylinder.py --Re 1789
python flow_past_cylinder.py --Re 1790
python flow_past_cylinder.py --Re 1791
python flow_past_cylinder.py --Re 1792
python flow_past_cylinder.py --Re 1793
python flow_past_cylinder.py --Re 1794
python flow_past_cylinder.py --Re 1795
python flow_past_cylinder.py --Re 1796
python flow_past_cylinder.py --Re 1797
python flow_past_cylinder.py --Re 1798
python flow_past_cylinder.py --Re 1799
python flow_past_cylinder.py --Re 1800
python flow_past_cylinder.py --Re 1801
python flow_past_cylinder.py --Re 1802
python flow_past_cylinder.py --Re 1803
python flow_past_cylinder.py --Re 1804
python flow_past_cylinder.py --Re 1805
python flow_past_cylinder.py --Re 1806
python flow_past_cylinder.py --Re 1807
python flow_past_cylinder.py --Re 1808
python flow_past_cylinder.py --Re 1809
python flow_past_cylinder.py --Re 1810
python flow_past_cylinder.py --Re 1811
python flow_past_cylinder.py --Re 1812
python flow_past_cylinder.py --Re 1813
python flow_past_cylinder.py --Re 1814
python flow_past_cylinder.py --Re 1815
python flow_past_cylinder.py --Re 1816
python flow_past_cylinder.py --Re 1817
python flow_past_cylinder.py --Re 1818
python flow_past_cylinder.py --Re 1819
python flow_past_cylinder.py --Re 1820
python flow_past_cylinder.py --Re 1821
python flow_past_cylinder.py --Re 1822
python flow_past_cylinder.py --Re 1823
python flow_past_cylinder.py --Re 1824
python flow_past_cylinder.py --Re 1825
python flow_past_cylinder.py --Re 1826
python flow_past_cylinder.py --Re 1827
