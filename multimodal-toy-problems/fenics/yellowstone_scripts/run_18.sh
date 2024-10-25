#!/bin/bash
#SBATCH -J fenicsx_18
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 964
python flow_past_cylinder.py --Re 965
python flow_past_cylinder.py --Re 966
python flow_past_cylinder.py --Re 967
python flow_past_cylinder.py --Re 968
python flow_past_cylinder.py --Re 969
python flow_past_cylinder.py --Re 970
python flow_past_cylinder.py --Re 971
python flow_past_cylinder.py --Re 972
python flow_past_cylinder.py --Re 973
python flow_past_cylinder.py --Re 974
python flow_past_cylinder.py --Re 975
python flow_past_cylinder.py --Re 976
python flow_past_cylinder.py --Re 977
python flow_past_cylinder.py --Re 978
python flow_past_cylinder.py --Re 979
python flow_past_cylinder.py --Re 980
python flow_past_cylinder.py --Re 981
python flow_past_cylinder.py --Re 982
python flow_past_cylinder.py --Re 983
python flow_past_cylinder.py --Re 984
python flow_past_cylinder.py --Re 985
python flow_past_cylinder.py --Re 986
python flow_past_cylinder.py --Re 987
python flow_past_cylinder.py --Re 988
python flow_past_cylinder.py --Re 989
python flow_past_cylinder.py --Re 990
python flow_past_cylinder.py --Re 991
python flow_past_cylinder.py --Re 992
python flow_past_cylinder.py --Re 993
python flow_past_cylinder.py --Re 994
python flow_past_cylinder.py --Re 995
python flow_past_cylinder.py --Re 996
python flow_past_cylinder.py --Re 997
python flow_past_cylinder.py --Re 998
python flow_past_cylinder.py --Re 999
python flow_past_cylinder.py --Re 1000
python flow_past_cylinder.py --Re 1001
python flow_past_cylinder.py --Re 1002
python flow_past_cylinder.py --Re 1003
python flow_past_cylinder.py --Re 1004
python flow_past_cylinder.py --Re 1005
python flow_past_cylinder.py --Re 1006
python flow_past_cylinder.py --Re 1007
python flow_past_cylinder.py --Re 1008
python flow_past_cylinder.py --Re 1009
python flow_past_cylinder.py --Re 1010
python flow_past_cylinder.py --Re 1011
