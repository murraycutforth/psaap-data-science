#!/bin/bash
#SBATCH -j fenicsx_18
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 964
mpirun -n 32 python flow_past_cylinder.py --Re 965
mpirun -n 32 python flow_past_cylinder.py --Re 966
mpirun -n 32 python flow_past_cylinder.py --Re 967
mpirun -n 32 python flow_past_cylinder.py --Re 968
mpirun -n 32 python flow_past_cylinder.py --Re 969
mpirun -n 32 python flow_past_cylinder.py --Re 970
mpirun -n 32 python flow_past_cylinder.py --Re 971
mpirun -n 32 python flow_past_cylinder.py --Re 972
mpirun -n 32 python flow_past_cylinder.py --Re 973
mpirun -n 32 python flow_past_cylinder.py --Re 974
mpirun -n 32 python flow_past_cylinder.py --Re 975
mpirun -n 32 python flow_past_cylinder.py --Re 976
mpirun -n 32 python flow_past_cylinder.py --Re 977
mpirun -n 32 python flow_past_cylinder.py --Re 978
mpirun -n 32 python flow_past_cylinder.py --Re 979
mpirun -n 32 python flow_past_cylinder.py --Re 980
mpirun -n 32 python flow_past_cylinder.py --Re 981
mpirun -n 32 python flow_past_cylinder.py --Re 982
mpirun -n 32 python flow_past_cylinder.py --Re 983
mpirun -n 32 python flow_past_cylinder.py --Re 984
mpirun -n 32 python flow_past_cylinder.py --Re 985
mpirun -n 32 python flow_past_cylinder.py --Re 986
mpirun -n 32 python flow_past_cylinder.py --Re 987
mpirun -n 32 python flow_past_cylinder.py --Re 988
mpirun -n 32 python flow_past_cylinder.py --Re 989
mpirun -n 32 python flow_past_cylinder.py --Re 990
mpirun -n 32 python flow_past_cylinder.py --Re 991
mpirun -n 32 python flow_past_cylinder.py --Re 992
mpirun -n 32 python flow_past_cylinder.py --Re 993
mpirun -n 32 python flow_past_cylinder.py --Re 994
mpirun -n 32 python flow_past_cylinder.py --Re 995
mpirun -n 32 python flow_past_cylinder.py --Re 996
mpirun -n 32 python flow_past_cylinder.py --Re 997
mpirun -n 32 python flow_past_cylinder.py --Re 998
mpirun -n 32 python flow_past_cylinder.py --Re 999
mpirun -n 32 python flow_past_cylinder.py --Re 1000
mpirun -n 32 python flow_past_cylinder.py --Re 1001
mpirun -n 32 python flow_past_cylinder.py --Re 1002
mpirun -n 32 python flow_past_cylinder.py --Re 1003
mpirun -n 32 python flow_past_cylinder.py --Re 1004
mpirun -n 32 python flow_past_cylinder.py --Re 1005
mpirun -n 32 python flow_past_cylinder.py --Re 1006
mpirun -n 32 python flow_past_cylinder.py --Re 1007
mpirun -n 32 python flow_past_cylinder.py --Re 1008
mpirun -n 32 python flow_past_cylinder.py --Re 1009
mpirun -n 32 python flow_past_cylinder.py --Re 1010
mpirun -n 32 python flow_past_cylinder.py --Re 1011
