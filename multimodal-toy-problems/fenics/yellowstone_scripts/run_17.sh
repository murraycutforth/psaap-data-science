#!/bin/bash
#SBATCH -J fenicsx_17
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 916
python flow_past_cylinder.py --Re 917
python flow_past_cylinder.py --Re 918
python flow_past_cylinder.py --Re 919
python flow_past_cylinder.py --Re 920
python flow_past_cylinder.py --Re 921
python flow_past_cylinder.py --Re 922
python flow_past_cylinder.py --Re 923
python flow_past_cylinder.py --Re 924
python flow_past_cylinder.py --Re 925
python flow_past_cylinder.py --Re 926
python flow_past_cylinder.py --Re 927
python flow_past_cylinder.py --Re 928
python flow_past_cylinder.py --Re 929
python flow_past_cylinder.py --Re 930
python flow_past_cylinder.py --Re 931
python flow_past_cylinder.py --Re 932
python flow_past_cylinder.py --Re 933
python flow_past_cylinder.py --Re 934
python flow_past_cylinder.py --Re 935
python flow_past_cylinder.py --Re 936
python flow_past_cylinder.py --Re 937
python flow_past_cylinder.py --Re 938
python flow_past_cylinder.py --Re 939
python flow_past_cylinder.py --Re 940
python flow_past_cylinder.py --Re 941
python flow_past_cylinder.py --Re 942
python flow_past_cylinder.py --Re 943
python flow_past_cylinder.py --Re 944
python flow_past_cylinder.py --Re 945
python flow_past_cylinder.py --Re 946
python flow_past_cylinder.py --Re 947
python flow_past_cylinder.py --Re 948
python flow_past_cylinder.py --Re 949
python flow_past_cylinder.py --Re 950
python flow_past_cylinder.py --Re 951
python flow_past_cylinder.py --Re 952
python flow_past_cylinder.py --Re 953
python flow_past_cylinder.py --Re 954
python flow_past_cylinder.py --Re 955
python flow_past_cylinder.py --Re 956
python flow_past_cylinder.py --Re 957
python flow_past_cylinder.py --Re 958
python flow_past_cylinder.py --Re 959
python flow_past_cylinder.py --Re 960
python flow_past_cylinder.py --Re 961
python flow_past_cylinder.py --Re 962
python flow_past_cylinder.py --Re 963
