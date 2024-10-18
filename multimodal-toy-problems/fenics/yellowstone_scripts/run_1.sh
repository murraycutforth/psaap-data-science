#!/bin/bash
#sbatch -j fenicsx_1
#sbatch -n 1
#sbatch -t 48:00:00
#sbatch -p cpu
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
mpirun -n 32 python flow_past_cylinder.py --Re 244
mpirun -n 32 python flow_past_cylinder.py --Re 245
mpirun -n 32 python flow_past_cylinder.py --Re 246
mpirun -n 32 python flow_past_cylinder.py --Re 247
mpirun -n 32 python flow_past_cylinder.py --Re 248
mpirun -n 32 python flow_past_cylinder.py --Re 249
mpirun -n 32 python flow_past_cylinder.py --Re 250
mpirun -n 32 python flow_past_cylinder.py --Re 251
mpirun -n 32 python flow_past_cylinder.py --Re 252
mpirun -n 32 python flow_past_cylinder.py --Re 253
mpirun -n 32 python flow_past_cylinder.py --Re 254
mpirun -n 32 python flow_past_cylinder.py --Re 255
mpirun -n 32 python flow_past_cylinder.py --Re 256
mpirun -n 32 python flow_past_cylinder.py --Re 257
mpirun -n 32 python flow_past_cylinder.py --Re 258
mpirun -n 32 python flow_past_cylinder.py --Re 259
mpirun -n 32 python flow_past_cylinder.py --Re 260
mpirun -n 32 python flow_past_cylinder.py --Re 261
mpirun -n 32 python flow_past_cylinder.py --Re 262
mpirun -n 32 python flow_past_cylinder.py --Re 263
mpirun -n 32 python flow_past_cylinder.py --Re 264
mpirun -n 32 python flow_past_cylinder.py --Re 265
mpirun -n 32 python flow_past_cylinder.py --Re 266
mpirun -n 32 python flow_past_cylinder.py --Re 267
mpirun -n 32 python flow_past_cylinder.py --Re 268
mpirun -n 32 python flow_past_cylinder.py --Re 269
mpirun -n 32 python flow_past_cylinder.py --Re 270
mpirun -n 32 python flow_past_cylinder.py --Re 271
mpirun -n 32 python flow_past_cylinder.py --Re 272
mpirun -n 32 python flow_past_cylinder.py --Re 273
mpirun -n 32 python flow_past_cylinder.py --Re 274
mpirun -n 32 python flow_past_cylinder.py --Re 275
mpirun -n 32 python flow_past_cylinder.py --Re 276
mpirun -n 32 python flow_past_cylinder.py --Re 277
mpirun -n 32 python flow_past_cylinder.py --Re 278
mpirun -n 32 python flow_past_cylinder.py --Re 279
mpirun -n 32 python flow_past_cylinder.py --Re 280
mpirun -n 32 python flow_past_cylinder.py --Re 281
mpirun -n 32 python flow_past_cylinder.py --Re 282
mpirun -n 32 python flow_past_cylinder.py --Re 283
mpirun -n 32 python flow_past_cylinder.py --Re 284
mpirun -n 32 python flow_past_cylinder.py --Re 285
mpirun -n 32 python flow_past_cylinder.py --Re 286
mpirun -n 32 python flow_past_cylinder.py --Re 287
mpirun -n 32 python flow_past_cylinder.py --Re 288
mpirun -n 32 python flow_past_cylinder.py --Re 289
mpirun -n 32 python flow_past_cylinder.py --Re 290
mpirun -n 32 python flow_past_cylinder.py --Re 291
