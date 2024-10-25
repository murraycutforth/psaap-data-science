#!/bin/bash
#SBATCH -J fenicsx_2
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 196
mpirun -n 32 python flow_past_cylinder.py --Re 197
mpirun -n 32 python flow_past_cylinder.py --Re 198
mpirun -n 32 python flow_past_cylinder.py --Re 199
mpirun -n 32 python flow_past_cylinder.py --Re 200
mpirun -n 32 python flow_past_cylinder.py --Re 201
mpirun -n 32 python flow_past_cylinder.py --Re 202
mpirun -n 32 python flow_past_cylinder.py --Re 203
mpirun -n 32 python flow_past_cylinder.py --Re 204
mpirun -n 32 python flow_past_cylinder.py --Re 205
mpirun -n 32 python flow_past_cylinder.py --Re 206
mpirun -n 32 python flow_past_cylinder.py --Re 207
mpirun -n 32 python flow_past_cylinder.py --Re 208
mpirun -n 32 python flow_past_cylinder.py --Re 209
mpirun -n 32 python flow_past_cylinder.py --Re 210
mpirun -n 32 python flow_past_cylinder.py --Re 211
mpirun -n 32 python flow_past_cylinder.py --Re 212
mpirun -n 32 python flow_past_cylinder.py --Re 213
mpirun -n 32 python flow_past_cylinder.py --Re 214
mpirun -n 32 python flow_past_cylinder.py --Re 215
mpirun -n 32 python flow_past_cylinder.py --Re 216
mpirun -n 32 python flow_past_cylinder.py --Re 217
mpirun -n 32 python flow_past_cylinder.py --Re 218
mpirun -n 32 python flow_past_cylinder.py --Re 219
mpirun -n 32 python flow_past_cylinder.py --Re 220
mpirun -n 32 python flow_past_cylinder.py --Re 221
mpirun -n 32 python flow_past_cylinder.py --Re 222
mpirun -n 32 python flow_past_cylinder.py --Re 223
mpirun -n 32 python flow_past_cylinder.py --Re 224
mpirun -n 32 python flow_past_cylinder.py --Re 225
mpirun -n 32 python flow_past_cylinder.py --Re 226
mpirun -n 32 python flow_past_cylinder.py --Re 227
mpirun -n 32 python flow_past_cylinder.py --Re 228
mpirun -n 32 python flow_past_cylinder.py --Re 229
mpirun -n 32 python flow_past_cylinder.py --Re 230
mpirun -n 32 python flow_past_cylinder.py --Re 231
mpirun -n 32 python flow_past_cylinder.py --Re 232
mpirun -n 32 python flow_past_cylinder.py --Re 233
mpirun -n 32 python flow_past_cylinder.py --Re 234
mpirun -n 32 python flow_past_cylinder.py --Re 235
mpirun -n 32 python flow_past_cylinder.py --Re 236
mpirun -n 32 python flow_past_cylinder.py --Re 237
mpirun -n 32 python flow_past_cylinder.py --Re 238
mpirun -n 32 python flow_past_cylinder.py --Re 239
mpirun -n 32 python flow_past_cylinder.py --Re 240
mpirun -n 32 python flow_past_cylinder.py --Re 241
mpirun -n 32 python flow_past_cylinder.py --Re 242
mpirun -n 32 python flow_past_cylinder.py --Re 243
