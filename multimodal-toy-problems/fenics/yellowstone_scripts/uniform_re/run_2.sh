#!/bin/bash
#SBATCH -J fenicsx_2
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 196
python flow_past_cylinder.py --Re 197
python flow_past_cylinder.py --Re 198
python flow_past_cylinder.py --Re 199
python flow_past_cylinder.py --Re 200
python flow_past_cylinder.py --Re 201
python flow_past_cylinder.py --Re 202
python flow_past_cylinder.py --Re 203
python flow_past_cylinder.py --Re 204
python flow_past_cylinder.py --Re 205
python flow_past_cylinder.py --Re 206
python flow_past_cylinder.py --Re 207
python flow_past_cylinder.py --Re 208
python flow_past_cylinder.py --Re 209
python flow_past_cylinder.py --Re 210
python flow_past_cylinder.py --Re 211
python flow_past_cylinder.py --Re 212
python flow_past_cylinder.py --Re 213
python flow_past_cylinder.py --Re 214
python flow_past_cylinder.py --Re 215
python flow_past_cylinder.py --Re 216
python flow_past_cylinder.py --Re 217
python flow_past_cylinder.py --Re 218
python flow_past_cylinder.py --Re 219
python flow_past_cylinder.py --Re 220
python flow_past_cylinder.py --Re 221
python flow_past_cylinder.py --Re 222
python flow_past_cylinder.py --Re 223
python flow_past_cylinder.py --Re 224
python flow_past_cylinder.py --Re 225
python flow_past_cylinder.py --Re 226
python flow_past_cylinder.py --Re 227
python flow_past_cylinder.py --Re 228
python flow_past_cylinder.py --Re 229
python flow_past_cylinder.py --Re 230
python flow_past_cylinder.py --Re 231
python flow_past_cylinder.py --Re 232
python flow_past_cylinder.py --Re 233
python flow_past_cylinder.py --Re 234
python flow_past_cylinder.py --Re 235
python flow_past_cylinder.py --Re 236
python flow_past_cylinder.py --Re 237
python flow_past_cylinder.py --Re 238
python flow_past_cylinder.py --Re 239
python flow_past_cylinder.py --Re 240
python flow_past_cylinder.py --Re 241
python flow_past_cylinder.py --Re 242
python flow_past_cylinder.py --Re 243
