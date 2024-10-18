#!/bin/bash
#sbatch -j fenicsx_0
#sbatch -n 1
#sbatch -t 48:00:00
#sbatch -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 100
mpirun -n 32 python flow_past_cylinder.py --Re 101
mpirun -n 32 python flow_past_cylinder.py --Re 102
mpirun -n 32 python flow_past_cylinder.py --Re 103
mpirun -n 32 python flow_past_cylinder.py --Re 104
mpirun -n 32 python flow_past_cylinder.py --Re 105
mpirun -n 32 python flow_past_cylinder.py --Re 106
mpirun -n 32 python flow_past_cylinder.py --Re 107
mpirun -n 32 python flow_past_cylinder.py --Re 108
mpirun -n 32 python flow_past_cylinder.py --Re 109
mpirun -n 32 python flow_past_cylinder.py --Re 110
mpirun -n 32 python flow_past_cylinder.py --Re 111
mpirun -n 32 python flow_past_cylinder.py --Re 112
mpirun -n 32 python flow_past_cylinder.py --Re 113
mpirun -n 32 python flow_past_cylinder.py --Re 114
mpirun -n 32 python flow_past_cylinder.py --Re 115
mpirun -n 32 python flow_past_cylinder.py --Re 116
mpirun -n 32 python flow_past_cylinder.py --Re 117
mpirun -n 32 python flow_past_cylinder.py --Re 118
mpirun -n 32 python flow_past_cylinder.py --Re 119
mpirun -n 32 python flow_past_cylinder.py --Re 120
mpirun -n 32 python flow_past_cylinder.py --Re 121
mpirun -n 32 python flow_past_cylinder.py --Re 122
mpirun -n 32 python flow_past_cylinder.py --Re 123
mpirun -n 32 python flow_past_cylinder.py --Re 124
mpirun -n 32 python flow_past_cylinder.py --Re 125
mpirun -n 32 python flow_past_cylinder.py --Re 126
mpirun -n 32 python flow_past_cylinder.py --Re 127
mpirun -n 32 python flow_past_cylinder.py --Re 128
mpirun -n 32 python flow_past_cylinder.py --Re 129
mpirun -n 32 python flow_past_cylinder.py --Re 130
mpirun -n 32 python flow_past_cylinder.py --Re 131
mpirun -n 32 python flow_past_cylinder.py --Re 132
mpirun -n 32 python flow_past_cylinder.py --Re 133
mpirun -n 32 python flow_past_cylinder.py --Re 134
mpirun -n 32 python flow_past_cylinder.py --Re 135
mpirun -n 32 python flow_past_cylinder.py --Re 136
mpirun -n 32 python flow_past_cylinder.py --Re 137
mpirun -n 32 python flow_past_cylinder.py --Re 138
mpirun -n 32 python flow_past_cylinder.py --Re 139
mpirun -n 32 python flow_past_cylinder.py --Re 140
mpirun -n 32 python flow_past_cylinder.py --Re 141
mpirun -n 32 python flow_past_cylinder.py --Re 142
mpirun -n 32 python flow_past_cylinder.py --Re 143
mpirun -n 32 python flow_past_cylinder.py --Re 144
mpirun -n 32 python flow_past_cylinder.py --Re 145
mpirun -n 32 python flow_past_cylinder.py --Re 146
mpirun -n 32 python flow_past_cylinder.py --Re 147
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
