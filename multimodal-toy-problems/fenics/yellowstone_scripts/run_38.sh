#!/bin/bash
#SBATCH -J fenicsx_38
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1924
mpirun -n 32 python flow_past_cylinder.py --Re 1925
mpirun -n 32 python flow_past_cylinder.py --Re 1926
mpirun -n 32 python flow_past_cylinder.py --Re 1927
mpirun -n 32 python flow_past_cylinder.py --Re 1928
mpirun -n 32 python flow_past_cylinder.py --Re 1929
mpirun -n 32 python flow_past_cylinder.py --Re 1930
mpirun -n 32 python flow_past_cylinder.py --Re 1931
mpirun -n 32 python flow_past_cylinder.py --Re 1932
mpirun -n 32 python flow_past_cylinder.py --Re 1933
mpirun -n 32 python flow_past_cylinder.py --Re 1934
mpirun -n 32 python flow_past_cylinder.py --Re 1935
mpirun -n 32 python flow_past_cylinder.py --Re 1936
mpirun -n 32 python flow_past_cylinder.py --Re 1937
mpirun -n 32 python flow_past_cylinder.py --Re 1938
mpirun -n 32 python flow_past_cylinder.py --Re 1939
mpirun -n 32 python flow_past_cylinder.py --Re 1940
mpirun -n 32 python flow_past_cylinder.py --Re 1941
mpirun -n 32 python flow_past_cylinder.py --Re 1942
mpirun -n 32 python flow_past_cylinder.py --Re 1943
mpirun -n 32 python flow_past_cylinder.py --Re 1944
mpirun -n 32 python flow_past_cylinder.py --Re 1945
mpirun -n 32 python flow_past_cylinder.py --Re 1946
mpirun -n 32 python flow_past_cylinder.py --Re 1947
mpirun -n 32 python flow_past_cylinder.py --Re 1948
mpirun -n 32 python flow_past_cylinder.py --Re 1949
mpirun -n 32 python flow_past_cylinder.py --Re 1950
mpirun -n 32 python flow_past_cylinder.py --Re 1951
mpirun -n 32 python flow_past_cylinder.py --Re 1952
mpirun -n 32 python flow_past_cylinder.py --Re 1953
mpirun -n 32 python flow_past_cylinder.py --Re 1954
mpirun -n 32 python flow_past_cylinder.py --Re 1955
mpirun -n 32 python flow_past_cylinder.py --Re 1956
mpirun -n 32 python flow_past_cylinder.py --Re 1957
mpirun -n 32 python flow_past_cylinder.py --Re 1958
mpirun -n 32 python flow_past_cylinder.py --Re 1959
mpirun -n 32 python flow_past_cylinder.py --Re 1960
mpirun -n 32 python flow_past_cylinder.py --Re 1961
mpirun -n 32 python flow_past_cylinder.py --Re 1962
mpirun -n 32 python flow_past_cylinder.py --Re 1963
mpirun -n 32 python flow_past_cylinder.py --Re 1964
mpirun -n 32 python flow_past_cylinder.py --Re 1965
mpirun -n 32 python flow_past_cylinder.py --Re 1966
mpirun -n 32 python flow_past_cylinder.py --Re 1967
mpirun -n 32 python flow_past_cylinder.py --Re 1968
mpirun -n 32 python flow_past_cylinder.py --Re 1969
mpirun -n 32 python flow_past_cylinder.py --Re 1970
mpirun -n 32 python flow_past_cylinder.py --Re 1971
