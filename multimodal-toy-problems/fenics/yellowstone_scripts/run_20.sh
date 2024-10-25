#!/bin/bash
#SBATCH -J fenicsx_20
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1060
python flow_past_cylinder.py --Re 1061
python flow_past_cylinder.py --Re 1062
python flow_past_cylinder.py --Re 1063
python flow_past_cylinder.py --Re 1064
python flow_past_cylinder.py --Re 1065
python flow_past_cylinder.py --Re 1066
python flow_past_cylinder.py --Re 1067
python flow_past_cylinder.py --Re 1068
python flow_past_cylinder.py --Re 1069
python flow_past_cylinder.py --Re 1070
python flow_past_cylinder.py --Re 1071
python flow_past_cylinder.py --Re 1072
python flow_past_cylinder.py --Re 1073
python flow_past_cylinder.py --Re 1074
python flow_past_cylinder.py --Re 1075
python flow_past_cylinder.py --Re 1076
python flow_past_cylinder.py --Re 1077
python flow_past_cylinder.py --Re 1078
python flow_past_cylinder.py --Re 1079
python flow_past_cylinder.py --Re 1080
python flow_past_cylinder.py --Re 1081
python flow_past_cylinder.py --Re 1082
python flow_past_cylinder.py --Re 1083
python flow_past_cylinder.py --Re 1084
python flow_past_cylinder.py --Re 1085
python flow_past_cylinder.py --Re 1086
python flow_past_cylinder.py --Re 1087
python flow_past_cylinder.py --Re 1088
python flow_past_cylinder.py --Re 1089
python flow_past_cylinder.py --Re 1090
python flow_past_cylinder.py --Re 1091
python flow_past_cylinder.py --Re 1092
python flow_past_cylinder.py --Re 1093
python flow_past_cylinder.py --Re 1094
python flow_past_cylinder.py --Re 1095
python flow_past_cylinder.py --Re 1096
python flow_past_cylinder.py --Re 1097
python flow_past_cylinder.py --Re 1098
python flow_past_cylinder.py --Re 1099
python flow_past_cylinder.py --Re 1100
python flow_past_cylinder.py --Re 1101
python flow_past_cylinder.py --Re 1102
python flow_past_cylinder.py --Re 1103
python flow_past_cylinder.py --Re 1104
python flow_past_cylinder.py --Re 1105
python flow_past_cylinder.py --Re 1106
python flow_past_cylinder.py --Re 1107
