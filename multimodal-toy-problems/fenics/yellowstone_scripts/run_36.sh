#!/bin/bash
#SBATCH -j fenicsx_36
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1828
mpirun -n 32 python flow_past_cylinder.py --Re 1829
mpirun -n 32 python flow_past_cylinder.py --Re 1830
mpirun -n 32 python flow_past_cylinder.py --Re 1831
mpirun -n 32 python flow_past_cylinder.py --Re 1832
mpirun -n 32 python flow_past_cylinder.py --Re 1833
mpirun -n 32 python flow_past_cylinder.py --Re 1834
mpirun -n 32 python flow_past_cylinder.py --Re 1835
mpirun -n 32 python flow_past_cylinder.py --Re 1836
mpirun -n 32 python flow_past_cylinder.py --Re 1837
mpirun -n 32 python flow_past_cylinder.py --Re 1838
mpirun -n 32 python flow_past_cylinder.py --Re 1839
mpirun -n 32 python flow_past_cylinder.py --Re 1840
mpirun -n 32 python flow_past_cylinder.py --Re 1841
mpirun -n 32 python flow_past_cylinder.py --Re 1842
mpirun -n 32 python flow_past_cylinder.py --Re 1843
mpirun -n 32 python flow_past_cylinder.py --Re 1844
mpirun -n 32 python flow_past_cylinder.py --Re 1845
mpirun -n 32 python flow_past_cylinder.py --Re 1846
mpirun -n 32 python flow_past_cylinder.py --Re 1847
mpirun -n 32 python flow_past_cylinder.py --Re 1848
mpirun -n 32 python flow_past_cylinder.py --Re 1849
mpirun -n 32 python flow_past_cylinder.py --Re 1850
mpirun -n 32 python flow_past_cylinder.py --Re 1851
mpirun -n 32 python flow_past_cylinder.py --Re 1852
mpirun -n 32 python flow_past_cylinder.py --Re 1853
mpirun -n 32 python flow_past_cylinder.py --Re 1854
mpirun -n 32 python flow_past_cylinder.py --Re 1855
mpirun -n 32 python flow_past_cylinder.py --Re 1856
mpirun -n 32 python flow_past_cylinder.py --Re 1857
mpirun -n 32 python flow_past_cylinder.py --Re 1858
mpirun -n 32 python flow_past_cylinder.py --Re 1859
mpirun -n 32 python flow_past_cylinder.py --Re 1860
mpirun -n 32 python flow_past_cylinder.py --Re 1861
mpirun -n 32 python flow_past_cylinder.py --Re 1862
mpirun -n 32 python flow_past_cylinder.py --Re 1863
mpirun -n 32 python flow_past_cylinder.py --Re 1864
mpirun -n 32 python flow_past_cylinder.py --Re 1865
mpirun -n 32 python flow_past_cylinder.py --Re 1866
mpirun -n 32 python flow_past_cylinder.py --Re 1867
mpirun -n 32 python flow_past_cylinder.py --Re 1868
mpirun -n 32 python flow_past_cylinder.py --Re 1869
mpirun -n 32 python flow_past_cylinder.py --Re 1870
mpirun -n 32 python flow_past_cylinder.py --Re 1871
mpirun -n 32 python flow_past_cylinder.py --Re 1872
mpirun -n 32 python flow_past_cylinder.py --Re 1873
mpirun -n 32 python flow_past_cylinder.py --Re 1874
mpirun -n 32 python flow_past_cylinder.py --Re 1875
