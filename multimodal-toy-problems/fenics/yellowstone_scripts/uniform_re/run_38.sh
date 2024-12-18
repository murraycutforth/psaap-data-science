#!/bin/bash
#SBATCH -J fenicsx_38
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1924
python flow_past_cylinder.py --Re 1925
python flow_past_cylinder.py --Re 1926
python flow_past_cylinder.py --Re 1927
python flow_past_cylinder.py --Re 1928
python flow_past_cylinder.py --Re 1929
python flow_past_cylinder.py --Re 1930
python flow_past_cylinder.py --Re 1931
python flow_past_cylinder.py --Re 1932
python flow_past_cylinder.py --Re 1933
python flow_past_cylinder.py --Re 1934
python flow_past_cylinder.py --Re 1935
python flow_past_cylinder.py --Re 1936
python flow_past_cylinder.py --Re 1937
python flow_past_cylinder.py --Re 1938
python flow_past_cylinder.py --Re 1939
python flow_past_cylinder.py --Re 1940
python flow_past_cylinder.py --Re 1941
python flow_past_cylinder.py --Re 1942
python flow_past_cylinder.py --Re 1943
python flow_past_cylinder.py --Re 1944
python flow_past_cylinder.py --Re 1945
python flow_past_cylinder.py --Re 1946
python flow_past_cylinder.py --Re 1947
python flow_past_cylinder.py --Re 1948
python flow_past_cylinder.py --Re 1949
python flow_past_cylinder.py --Re 1950
python flow_past_cylinder.py --Re 1951
python flow_past_cylinder.py --Re 1952
python flow_past_cylinder.py --Re 1953
python flow_past_cylinder.py --Re 1954
python flow_past_cylinder.py --Re 1955
python flow_past_cylinder.py --Re 1956
python flow_past_cylinder.py --Re 1957
python flow_past_cylinder.py --Re 1958
python flow_past_cylinder.py --Re 1959
python flow_past_cylinder.py --Re 1960
python flow_past_cylinder.py --Re 1961
python flow_past_cylinder.py --Re 1962
python flow_past_cylinder.py --Re 1963
python flow_past_cylinder.py --Re 1964
python flow_past_cylinder.py --Re 1965
python flow_past_cylinder.py --Re 1966
python flow_past_cylinder.py --Re 1967
python flow_past_cylinder.py --Re 1968
python flow_past_cylinder.py --Re 1969
python flow_past_cylinder.py --Re 1970
python flow_past_cylinder.py --Re 1971
