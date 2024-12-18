#!/bin/bash
#SBATCH -J fenicsx_0
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 100
python flow_past_cylinder.py --Re 101
python flow_past_cylinder.py --Re 102
python flow_past_cylinder.py --Re 103
python flow_past_cylinder.py --Re 104
python flow_past_cylinder.py --Re 105
python flow_past_cylinder.py --Re 106
python flow_past_cylinder.py --Re 107
python flow_past_cylinder.py --Re 108
python flow_past_cylinder.py --Re 109
python flow_past_cylinder.py --Re 110
python flow_past_cylinder.py --Re 111
python flow_past_cylinder.py --Re 112
python flow_past_cylinder.py --Re 113
python flow_past_cylinder.py --Re 114
python flow_past_cylinder.py --Re 115
python flow_past_cylinder.py --Re 116
python flow_past_cylinder.py --Re 117
python flow_past_cylinder.py --Re 118
python flow_past_cylinder.py --Re 119
python flow_past_cylinder.py --Re 120
python flow_past_cylinder.py --Re 121
python flow_past_cylinder.py --Re 122
python flow_past_cylinder.py --Re 123
python flow_past_cylinder.py --Re 124
python flow_past_cylinder.py --Re 125
python flow_past_cylinder.py --Re 126
python flow_past_cylinder.py --Re 127
python flow_past_cylinder.py --Re 128
python flow_past_cylinder.py --Re 129
python flow_past_cylinder.py --Re 130
python flow_past_cylinder.py --Re 131
python flow_past_cylinder.py --Re 132
python flow_past_cylinder.py --Re 133
python flow_past_cylinder.py --Re 134
python flow_past_cylinder.py --Re 135
python flow_past_cylinder.py --Re 136
python flow_past_cylinder.py --Re 137
python flow_past_cylinder.py --Re 138
python flow_past_cylinder.py --Re 139
python flow_past_cylinder.py --Re 140
python flow_past_cylinder.py --Re 141
python flow_past_cylinder.py --Re 142
python flow_past_cylinder.py --Re 143
python flow_past_cylinder.py --Re 144
python flow_past_cylinder.py --Re 145
python flow_past_cylinder.py --Re 146
python flow_past_cylinder.py --Re 147
