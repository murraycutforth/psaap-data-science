#!/bin/bash
#SBATCH -J fenicsx_1
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 148
python flow_past_cylinder.py --Re 149
python flow_past_cylinder.py --Re 150
python flow_past_cylinder.py --Re 151
python flow_past_cylinder.py --Re 152
python flow_past_cylinder.py --Re 153
python flow_past_cylinder.py --Re 154
python flow_past_cylinder.py --Re 155
python flow_past_cylinder.py --Re 156
python flow_past_cylinder.py --Re 157
python flow_past_cylinder.py --Re 158
python flow_past_cylinder.py --Re 159
python flow_past_cylinder.py --Re 160
python flow_past_cylinder.py --Re 161
python flow_past_cylinder.py --Re 162
python flow_past_cylinder.py --Re 163
python flow_past_cylinder.py --Re 164
python flow_past_cylinder.py --Re 165
python flow_past_cylinder.py --Re 166
python flow_past_cylinder.py --Re 167
python flow_past_cylinder.py --Re 168
python flow_past_cylinder.py --Re 169
python flow_past_cylinder.py --Re 170
python flow_past_cylinder.py --Re 171
python flow_past_cylinder.py --Re 172
python flow_past_cylinder.py --Re 173
python flow_past_cylinder.py --Re 174
python flow_past_cylinder.py --Re 175
python flow_past_cylinder.py --Re 176
python flow_past_cylinder.py --Re 177
python flow_past_cylinder.py --Re 178
python flow_past_cylinder.py --Re 179
python flow_past_cylinder.py --Re 180
python flow_past_cylinder.py --Re 181
python flow_past_cylinder.py --Re 182
python flow_past_cylinder.py --Re 183
python flow_past_cylinder.py --Re 184
python flow_past_cylinder.py --Re 185
python flow_past_cylinder.py --Re 186
python flow_past_cylinder.py --Re 187
python flow_past_cylinder.py --Re 188
python flow_past_cylinder.py --Re 189
python flow_past_cylinder.py --Re 190
python flow_past_cylinder.py --Re 191
python flow_past_cylinder.py --Re 192
python flow_past_cylinder.py --Re 193
python flow_past_cylinder.py --Re 194
python flow_past_cylinder.py --Re 195
