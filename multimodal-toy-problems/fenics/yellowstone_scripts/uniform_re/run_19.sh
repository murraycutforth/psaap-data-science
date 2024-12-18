#!/bin/bash
#SBATCH -J fenicsx_19
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1012
python flow_past_cylinder.py --Re 1013
python flow_past_cylinder.py --Re 1014
python flow_past_cylinder.py --Re 1015
python flow_past_cylinder.py --Re 1016
python flow_past_cylinder.py --Re 1017
python flow_past_cylinder.py --Re 1018
python flow_past_cylinder.py --Re 1019
python flow_past_cylinder.py --Re 1020
python flow_past_cylinder.py --Re 1021
python flow_past_cylinder.py --Re 1022
python flow_past_cylinder.py --Re 1023
python flow_past_cylinder.py --Re 1024
python flow_past_cylinder.py --Re 1025
python flow_past_cylinder.py --Re 1026
python flow_past_cylinder.py --Re 1027
python flow_past_cylinder.py --Re 1028
python flow_past_cylinder.py --Re 1029
python flow_past_cylinder.py --Re 1030
python flow_past_cylinder.py --Re 1031
python flow_past_cylinder.py --Re 1032
python flow_past_cylinder.py --Re 1033
python flow_past_cylinder.py --Re 1034
python flow_past_cylinder.py --Re 1035
python flow_past_cylinder.py --Re 1036
python flow_past_cylinder.py --Re 1037
python flow_past_cylinder.py --Re 1038
python flow_past_cylinder.py --Re 1039
python flow_past_cylinder.py --Re 1040
python flow_past_cylinder.py --Re 1041
python flow_past_cylinder.py --Re 1042
python flow_past_cylinder.py --Re 1043
python flow_past_cylinder.py --Re 1044
python flow_past_cylinder.py --Re 1045
python flow_past_cylinder.py --Re 1046
python flow_past_cylinder.py --Re 1047
python flow_past_cylinder.py --Re 1048
python flow_past_cylinder.py --Re 1049
python flow_past_cylinder.py --Re 1050
python flow_past_cylinder.py --Re 1051
python flow_past_cylinder.py --Re 1052
python flow_past_cylinder.py --Re 1053
python flow_past_cylinder.py --Re 1054
python flow_past_cylinder.py --Re 1055
python flow_past_cylinder.py --Re 1056
python flow_past_cylinder.py --Re 1057
python flow_past_cylinder.py --Re 1058
python flow_past_cylinder.py --Re 1059
