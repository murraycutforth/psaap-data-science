#!/bin/bash
#SBATCH -j fenicsx_5
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 340
mpirun -n 32 python flow_past_cylinder.py --Re 341
mpirun -n 32 python flow_past_cylinder.py --Re 342
mpirun -n 32 python flow_past_cylinder.py --Re 343
mpirun -n 32 python flow_past_cylinder.py --Re 344
mpirun -n 32 python flow_past_cylinder.py --Re 345
mpirun -n 32 python flow_past_cylinder.py --Re 346
mpirun -n 32 python flow_past_cylinder.py --Re 347
mpirun -n 32 python flow_past_cylinder.py --Re 348
mpirun -n 32 python flow_past_cylinder.py --Re 349
mpirun -n 32 python flow_past_cylinder.py --Re 350
mpirun -n 32 python flow_past_cylinder.py --Re 351
mpirun -n 32 python flow_past_cylinder.py --Re 352
mpirun -n 32 python flow_past_cylinder.py --Re 353
mpirun -n 32 python flow_past_cylinder.py --Re 354
mpirun -n 32 python flow_past_cylinder.py --Re 355
mpirun -n 32 python flow_past_cylinder.py --Re 356
mpirun -n 32 python flow_past_cylinder.py --Re 357
mpirun -n 32 python flow_past_cylinder.py --Re 358
mpirun -n 32 python flow_past_cylinder.py --Re 359
mpirun -n 32 python flow_past_cylinder.py --Re 360
mpirun -n 32 python flow_past_cylinder.py --Re 361
mpirun -n 32 python flow_past_cylinder.py --Re 362
mpirun -n 32 python flow_past_cylinder.py --Re 363
mpirun -n 32 python flow_past_cylinder.py --Re 364
mpirun -n 32 python flow_past_cylinder.py --Re 365
mpirun -n 32 python flow_past_cylinder.py --Re 366
mpirun -n 32 python flow_past_cylinder.py --Re 367
mpirun -n 32 python flow_past_cylinder.py --Re 368
mpirun -n 32 python flow_past_cylinder.py --Re 369
mpirun -n 32 python flow_past_cylinder.py --Re 370
mpirun -n 32 python flow_past_cylinder.py --Re 371
mpirun -n 32 python flow_past_cylinder.py --Re 372
mpirun -n 32 python flow_past_cylinder.py --Re 373
mpirun -n 32 python flow_past_cylinder.py --Re 374
mpirun -n 32 python flow_past_cylinder.py --Re 375
mpirun -n 32 python flow_past_cylinder.py --Re 376
mpirun -n 32 python flow_past_cylinder.py --Re 377
mpirun -n 32 python flow_past_cylinder.py --Re 378
mpirun -n 32 python flow_past_cylinder.py --Re 379
mpirun -n 32 python flow_past_cylinder.py --Re 380
mpirun -n 32 python flow_past_cylinder.py --Re 381
mpirun -n 32 python flow_past_cylinder.py --Re 382
mpirun -n 32 python flow_past_cylinder.py --Re 383
mpirun -n 32 python flow_past_cylinder.py --Re 384
mpirun -n 32 python flow_past_cylinder.py --Re 385
mpirun -n 32 python flow_past_cylinder.py --Re 386
mpirun -n 32 python flow_past_cylinder.py --Re 387
