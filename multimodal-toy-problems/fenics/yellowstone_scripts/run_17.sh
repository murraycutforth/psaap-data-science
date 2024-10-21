#!/bin/bash
#SBATCH -j fenicsx_17
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 916
mpirun -n 32 python flow_past_cylinder.py --Re 917
mpirun -n 32 python flow_past_cylinder.py --Re 918
mpirun -n 32 python flow_past_cylinder.py --Re 919
mpirun -n 32 python flow_past_cylinder.py --Re 920
mpirun -n 32 python flow_past_cylinder.py --Re 921
mpirun -n 32 python flow_past_cylinder.py --Re 922
mpirun -n 32 python flow_past_cylinder.py --Re 923
mpirun -n 32 python flow_past_cylinder.py --Re 924
mpirun -n 32 python flow_past_cylinder.py --Re 925
mpirun -n 32 python flow_past_cylinder.py --Re 926
mpirun -n 32 python flow_past_cylinder.py --Re 927
mpirun -n 32 python flow_past_cylinder.py --Re 928
mpirun -n 32 python flow_past_cylinder.py --Re 929
mpirun -n 32 python flow_past_cylinder.py --Re 930
mpirun -n 32 python flow_past_cylinder.py --Re 931
mpirun -n 32 python flow_past_cylinder.py --Re 932
mpirun -n 32 python flow_past_cylinder.py --Re 933
mpirun -n 32 python flow_past_cylinder.py --Re 934
mpirun -n 32 python flow_past_cylinder.py --Re 935
mpirun -n 32 python flow_past_cylinder.py --Re 936
mpirun -n 32 python flow_past_cylinder.py --Re 937
mpirun -n 32 python flow_past_cylinder.py --Re 938
mpirun -n 32 python flow_past_cylinder.py --Re 939
mpirun -n 32 python flow_past_cylinder.py --Re 940
mpirun -n 32 python flow_past_cylinder.py --Re 941
mpirun -n 32 python flow_past_cylinder.py --Re 942
mpirun -n 32 python flow_past_cylinder.py --Re 943
mpirun -n 32 python flow_past_cylinder.py --Re 944
mpirun -n 32 python flow_past_cylinder.py --Re 945
mpirun -n 32 python flow_past_cylinder.py --Re 946
mpirun -n 32 python flow_past_cylinder.py --Re 947
mpirun -n 32 python flow_past_cylinder.py --Re 948
mpirun -n 32 python flow_past_cylinder.py --Re 949
mpirun -n 32 python flow_past_cylinder.py --Re 950
mpirun -n 32 python flow_past_cylinder.py --Re 951
mpirun -n 32 python flow_past_cylinder.py --Re 952
mpirun -n 32 python flow_past_cylinder.py --Re 953
mpirun -n 32 python flow_past_cylinder.py --Re 954
mpirun -n 32 python flow_past_cylinder.py --Re 955
mpirun -n 32 python flow_past_cylinder.py --Re 956
mpirun -n 32 python flow_past_cylinder.py --Re 957
mpirun -n 32 python flow_past_cylinder.py --Re 958
mpirun -n 32 python flow_past_cylinder.py --Re 959
mpirun -n 32 python flow_past_cylinder.py --Re 960
mpirun -n 32 python flow_past_cylinder.py --Re 961
mpirun -n 32 python flow_past_cylinder.py --Re 962
mpirun -n 32 python flow_past_cylinder.py --Re 963
