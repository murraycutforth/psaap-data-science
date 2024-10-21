#!/bin/bash
#SBATCH -j fenicsx_1
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 148
mpirun -n 32 python flow_past_cylinder.py --Re 149
mpirun -n 32 python flow_past_cylinder.py --Re 150
mpirun -n 32 python flow_past_cylinder.py --Re 151
mpirun -n 32 python flow_past_cylinder.py --Re 152
mpirun -n 32 python flow_past_cylinder.py --Re 153
mpirun -n 32 python flow_past_cylinder.py --Re 154
mpirun -n 32 python flow_past_cylinder.py --Re 155
mpirun -n 32 python flow_past_cylinder.py --Re 156
mpirun -n 32 python flow_past_cylinder.py --Re 157
mpirun -n 32 python flow_past_cylinder.py --Re 158
mpirun -n 32 python flow_past_cylinder.py --Re 159
mpirun -n 32 python flow_past_cylinder.py --Re 160
mpirun -n 32 python flow_past_cylinder.py --Re 161
mpirun -n 32 python flow_past_cylinder.py --Re 162
mpirun -n 32 python flow_past_cylinder.py --Re 163
mpirun -n 32 python flow_past_cylinder.py --Re 164
mpirun -n 32 python flow_past_cylinder.py --Re 165
mpirun -n 32 python flow_past_cylinder.py --Re 166
mpirun -n 32 python flow_past_cylinder.py --Re 167
mpirun -n 32 python flow_past_cylinder.py --Re 168
mpirun -n 32 python flow_past_cylinder.py --Re 169
mpirun -n 32 python flow_past_cylinder.py --Re 170
mpirun -n 32 python flow_past_cylinder.py --Re 171
mpirun -n 32 python flow_past_cylinder.py --Re 172
mpirun -n 32 python flow_past_cylinder.py --Re 173
mpirun -n 32 python flow_past_cylinder.py --Re 174
mpirun -n 32 python flow_past_cylinder.py --Re 175
mpirun -n 32 python flow_past_cylinder.py --Re 176
mpirun -n 32 python flow_past_cylinder.py --Re 177
mpirun -n 32 python flow_past_cylinder.py --Re 178
mpirun -n 32 python flow_past_cylinder.py --Re 179
mpirun -n 32 python flow_past_cylinder.py --Re 180
mpirun -n 32 python flow_past_cylinder.py --Re 181
mpirun -n 32 python flow_past_cylinder.py --Re 182
mpirun -n 32 python flow_past_cylinder.py --Re 183
mpirun -n 32 python flow_past_cylinder.py --Re 184
mpirun -n 32 python flow_past_cylinder.py --Re 185
mpirun -n 32 python flow_past_cylinder.py --Re 186
mpirun -n 32 python flow_past_cylinder.py --Re 187
mpirun -n 32 python flow_past_cylinder.py --Re 188
mpirun -n 32 python flow_past_cylinder.py --Re 189
mpirun -n 32 python flow_past_cylinder.py --Re 190
mpirun -n 32 python flow_past_cylinder.py --Re 191
mpirun -n 32 python flow_past_cylinder.py --Re 192
mpirun -n 32 python flow_past_cylinder.py --Re 193
mpirun -n 32 python flow_past_cylinder.py --Re 194
mpirun -n 32 python flow_past_cylinder.py --Re 195
