#!/bin/bash
#SBATCH -J fenicsx_3
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 244
python flow_past_cylinder.py --Re 245
python flow_past_cylinder.py --Re 246
python flow_past_cylinder.py --Re 247
python flow_past_cylinder.py --Re 248
python flow_past_cylinder.py --Re 249
python flow_past_cylinder.py --Re 250
python flow_past_cylinder.py --Re 251
python flow_past_cylinder.py --Re 252
python flow_past_cylinder.py --Re 253
python flow_past_cylinder.py --Re 254
python flow_past_cylinder.py --Re 255
python flow_past_cylinder.py --Re 256
python flow_past_cylinder.py --Re 257
python flow_past_cylinder.py --Re 258
python flow_past_cylinder.py --Re 259
python flow_past_cylinder.py --Re 260
python flow_past_cylinder.py --Re 261
python flow_past_cylinder.py --Re 262
python flow_past_cylinder.py --Re 263
python flow_past_cylinder.py --Re 264
python flow_past_cylinder.py --Re 265
python flow_past_cylinder.py --Re 266
python flow_past_cylinder.py --Re 267
python flow_past_cylinder.py --Re 268
python flow_past_cylinder.py --Re 269
python flow_past_cylinder.py --Re 270
python flow_past_cylinder.py --Re 271
python flow_past_cylinder.py --Re 272
python flow_past_cylinder.py --Re 273
python flow_past_cylinder.py --Re 274
python flow_past_cylinder.py --Re 275
python flow_past_cylinder.py --Re 276
python flow_past_cylinder.py --Re 277
python flow_past_cylinder.py --Re 278
python flow_past_cylinder.py --Re 279
python flow_past_cylinder.py --Re 280
python flow_past_cylinder.py --Re 281
python flow_past_cylinder.py --Re 282
python flow_past_cylinder.py --Re 283
python flow_past_cylinder.py --Re 284
python flow_past_cylinder.py --Re 285
python flow_past_cylinder.py --Re 286
python flow_past_cylinder.py --Re 287
python flow_past_cylinder.py --Re 288
python flow_past_cylinder.py --Re 289
python flow_past_cylinder.py --Re 290
python flow_past_cylinder.py --Re 291
