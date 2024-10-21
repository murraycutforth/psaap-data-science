#!/bin/bash
#SBATCH -j fenicsx_37
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1876
mpirun -n 32 python flow_past_cylinder.py --Re 1877
mpirun -n 32 python flow_past_cylinder.py --Re 1878
mpirun -n 32 python flow_past_cylinder.py --Re 1879
mpirun -n 32 python flow_past_cylinder.py --Re 1880
mpirun -n 32 python flow_past_cylinder.py --Re 1881
mpirun -n 32 python flow_past_cylinder.py --Re 1882
mpirun -n 32 python flow_past_cylinder.py --Re 1883
mpirun -n 32 python flow_past_cylinder.py --Re 1884
mpirun -n 32 python flow_past_cylinder.py --Re 1885
mpirun -n 32 python flow_past_cylinder.py --Re 1886
mpirun -n 32 python flow_past_cylinder.py --Re 1887
mpirun -n 32 python flow_past_cylinder.py --Re 1888
mpirun -n 32 python flow_past_cylinder.py --Re 1889
mpirun -n 32 python flow_past_cylinder.py --Re 1890
mpirun -n 32 python flow_past_cylinder.py --Re 1891
mpirun -n 32 python flow_past_cylinder.py --Re 1892
mpirun -n 32 python flow_past_cylinder.py --Re 1893
mpirun -n 32 python flow_past_cylinder.py --Re 1894
mpirun -n 32 python flow_past_cylinder.py --Re 1895
mpirun -n 32 python flow_past_cylinder.py --Re 1896
mpirun -n 32 python flow_past_cylinder.py --Re 1897
mpirun -n 32 python flow_past_cylinder.py --Re 1898
mpirun -n 32 python flow_past_cylinder.py --Re 1899
mpirun -n 32 python flow_past_cylinder.py --Re 1900
mpirun -n 32 python flow_past_cylinder.py --Re 1901
mpirun -n 32 python flow_past_cylinder.py --Re 1902
mpirun -n 32 python flow_past_cylinder.py --Re 1903
mpirun -n 32 python flow_past_cylinder.py --Re 1904
mpirun -n 32 python flow_past_cylinder.py --Re 1905
mpirun -n 32 python flow_past_cylinder.py --Re 1906
mpirun -n 32 python flow_past_cylinder.py --Re 1907
mpirun -n 32 python flow_past_cylinder.py --Re 1908
mpirun -n 32 python flow_past_cylinder.py --Re 1909
mpirun -n 32 python flow_past_cylinder.py --Re 1910
mpirun -n 32 python flow_past_cylinder.py --Re 1911
mpirun -n 32 python flow_past_cylinder.py --Re 1912
mpirun -n 32 python flow_past_cylinder.py --Re 1913
mpirun -n 32 python flow_past_cylinder.py --Re 1914
mpirun -n 32 python flow_past_cylinder.py --Re 1915
mpirun -n 32 python flow_past_cylinder.py --Re 1916
mpirun -n 32 python flow_past_cylinder.py --Re 1917
mpirun -n 32 python flow_past_cylinder.py --Re 1918
mpirun -n 32 python flow_past_cylinder.py --Re 1919
mpirun -n 32 python flow_past_cylinder.py --Re 1920
mpirun -n 32 python flow_past_cylinder.py --Re 1921
mpirun -n 32 python flow_past_cylinder.py --Re 1922
mpirun -n 32 python flow_past_cylinder.py --Re 1923
