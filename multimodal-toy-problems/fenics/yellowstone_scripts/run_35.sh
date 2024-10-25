#!/bin/bash
#SBATCH -J fenicsx_35
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1780
mpirun -n 32 python flow_past_cylinder.py --Re 1781
mpirun -n 32 python flow_past_cylinder.py --Re 1782
mpirun -n 32 python flow_past_cylinder.py --Re 1783
mpirun -n 32 python flow_past_cylinder.py --Re 1784
mpirun -n 32 python flow_past_cylinder.py --Re 1785
mpirun -n 32 python flow_past_cylinder.py --Re 1786
mpirun -n 32 python flow_past_cylinder.py --Re 1787
mpirun -n 32 python flow_past_cylinder.py --Re 1788
mpirun -n 32 python flow_past_cylinder.py --Re 1789
mpirun -n 32 python flow_past_cylinder.py --Re 1790
mpirun -n 32 python flow_past_cylinder.py --Re 1791
mpirun -n 32 python flow_past_cylinder.py --Re 1792
mpirun -n 32 python flow_past_cylinder.py --Re 1793
mpirun -n 32 python flow_past_cylinder.py --Re 1794
mpirun -n 32 python flow_past_cylinder.py --Re 1795
mpirun -n 32 python flow_past_cylinder.py --Re 1796
mpirun -n 32 python flow_past_cylinder.py --Re 1797
mpirun -n 32 python flow_past_cylinder.py --Re 1798
mpirun -n 32 python flow_past_cylinder.py --Re 1799
mpirun -n 32 python flow_past_cylinder.py --Re 1800
mpirun -n 32 python flow_past_cylinder.py --Re 1801
mpirun -n 32 python flow_past_cylinder.py --Re 1802
mpirun -n 32 python flow_past_cylinder.py --Re 1803
mpirun -n 32 python flow_past_cylinder.py --Re 1804
mpirun -n 32 python flow_past_cylinder.py --Re 1805
mpirun -n 32 python flow_past_cylinder.py --Re 1806
mpirun -n 32 python flow_past_cylinder.py --Re 1807
mpirun -n 32 python flow_past_cylinder.py --Re 1808
mpirun -n 32 python flow_past_cylinder.py --Re 1809
mpirun -n 32 python flow_past_cylinder.py --Re 1810
mpirun -n 32 python flow_past_cylinder.py --Re 1811
mpirun -n 32 python flow_past_cylinder.py --Re 1812
mpirun -n 32 python flow_past_cylinder.py --Re 1813
mpirun -n 32 python flow_past_cylinder.py --Re 1814
mpirun -n 32 python flow_past_cylinder.py --Re 1815
mpirun -n 32 python flow_past_cylinder.py --Re 1816
mpirun -n 32 python flow_past_cylinder.py --Re 1817
mpirun -n 32 python flow_past_cylinder.py --Re 1818
mpirun -n 32 python flow_past_cylinder.py --Re 1819
mpirun -n 32 python flow_past_cylinder.py --Re 1820
mpirun -n 32 python flow_past_cylinder.py --Re 1821
mpirun -n 32 python flow_past_cylinder.py --Re 1822
mpirun -n 32 python flow_past_cylinder.py --Re 1823
mpirun -n 32 python flow_past_cylinder.py --Re 1824
mpirun -n 32 python flow_past_cylinder.py --Re 1825
mpirun -n 32 python flow_past_cylinder.py --Re 1826
mpirun -n 32 python flow_past_cylinder.py --Re 1827
