#!/bin/bash
#SBATCH -J fenicsx_4
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 292
mpirun -n 32 python flow_past_cylinder.py --Re 293
mpirun -n 32 python flow_past_cylinder.py --Re 294
mpirun -n 32 python flow_past_cylinder.py --Re 295
mpirun -n 32 python flow_past_cylinder.py --Re 296
mpirun -n 32 python flow_past_cylinder.py --Re 297
mpirun -n 32 python flow_past_cylinder.py --Re 298
mpirun -n 32 python flow_past_cylinder.py --Re 299
mpirun -n 32 python flow_past_cylinder.py --Re 300
mpirun -n 32 python flow_past_cylinder.py --Re 301
mpirun -n 32 python flow_past_cylinder.py --Re 302
mpirun -n 32 python flow_past_cylinder.py --Re 303
mpirun -n 32 python flow_past_cylinder.py --Re 304
mpirun -n 32 python flow_past_cylinder.py --Re 305
mpirun -n 32 python flow_past_cylinder.py --Re 306
mpirun -n 32 python flow_past_cylinder.py --Re 307
mpirun -n 32 python flow_past_cylinder.py --Re 308
mpirun -n 32 python flow_past_cylinder.py --Re 309
mpirun -n 32 python flow_past_cylinder.py --Re 310
mpirun -n 32 python flow_past_cylinder.py --Re 311
mpirun -n 32 python flow_past_cylinder.py --Re 312
mpirun -n 32 python flow_past_cylinder.py --Re 313
mpirun -n 32 python flow_past_cylinder.py --Re 314
mpirun -n 32 python flow_past_cylinder.py --Re 315
mpirun -n 32 python flow_past_cylinder.py --Re 316
mpirun -n 32 python flow_past_cylinder.py --Re 317
mpirun -n 32 python flow_past_cylinder.py --Re 318
mpirun -n 32 python flow_past_cylinder.py --Re 319
mpirun -n 32 python flow_past_cylinder.py --Re 320
mpirun -n 32 python flow_past_cylinder.py --Re 321
mpirun -n 32 python flow_past_cylinder.py --Re 322
mpirun -n 32 python flow_past_cylinder.py --Re 323
mpirun -n 32 python flow_past_cylinder.py --Re 324
mpirun -n 32 python flow_past_cylinder.py --Re 325
mpirun -n 32 python flow_past_cylinder.py --Re 326
mpirun -n 32 python flow_past_cylinder.py --Re 327
mpirun -n 32 python flow_past_cylinder.py --Re 328
mpirun -n 32 python flow_past_cylinder.py --Re 329
mpirun -n 32 python flow_past_cylinder.py --Re 330
mpirun -n 32 python flow_past_cylinder.py --Re 331
mpirun -n 32 python flow_past_cylinder.py --Re 332
mpirun -n 32 python flow_past_cylinder.py --Re 333
mpirun -n 32 python flow_past_cylinder.py --Re 334
mpirun -n 32 python flow_past_cylinder.py --Re 335
mpirun -n 32 python flow_past_cylinder.py --Re 336
mpirun -n 32 python flow_past_cylinder.py --Re 337
mpirun -n 32 python flow_past_cylinder.py --Re 338
mpirun -n 32 python flow_past_cylinder.py --Re 339
