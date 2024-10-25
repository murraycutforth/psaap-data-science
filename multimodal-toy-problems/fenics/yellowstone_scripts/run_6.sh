#!/bin/bash
#SBATCH -J fenicsx_6
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 388
mpirun -n 32 python flow_past_cylinder.py --Re 389
mpirun -n 32 python flow_past_cylinder.py --Re 390
mpirun -n 32 python flow_past_cylinder.py --Re 391
mpirun -n 32 python flow_past_cylinder.py --Re 392
mpirun -n 32 python flow_past_cylinder.py --Re 393
mpirun -n 32 python flow_past_cylinder.py --Re 394
mpirun -n 32 python flow_past_cylinder.py --Re 395
mpirun -n 32 python flow_past_cylinder.py --Re 396
mpirun -n 32 python flow_past_cylinder.py --Re 397
mpirun -n 32 python flow_past_cylinder.py --Re 398
mpirun -n 32 python flow_past_cylinder.py --Re 399
mpirun -n 32 python flow_past_cylinder.py --Re 400
mpirun -n 32 python flow_past_cylinder.py --Re 401
mpirun -n 32 python flow_past_cylinder.py --Re 402
mpirun -n 32 python flow_past_cylinder.py --Re 403
mpirun -n 32 python flow_past_cylinder.py --Re 404
mpirun -n 32 python flow_past_cylinder.py --Re 405
mpirun -n 32 python flow_past_cylinder.py --Re 406
mpirun -n 32 python flow_past_cylinder.py --Re 407
mpirun -n 32 python flow_past_cylinder.py --Re 408
mpirun -n 32 python flow_past_cylinder.py --Re 409
mpirun -n 32 python flow_past_cylinder.py --Re 410
mpirun -n 32 python flow_past_cylinder.py --Re 411
mpirun -n 32 python flow_past_cylinder.py --Re 412
mpirun -n 32 python flow_past_cylinder.py --Re 413
mpirun -n 32 python flow_past_cylinder.py --Re 414
mpirun -n 32 python flow_past_cylinder.py --Re 415
mpirun -n 32 python flow_past_cylinder.py --Re 416
mpirun -n 32 python flow_past_cylinder.py --Re 417
mpirun -n 32 python flow_past_cylinder.py --Re 418
mpirun -n 32 python flow_past_cylinder.py --Re 419
mpirun -n 32 python flow_past_cylinder.py --Re 420
mpirun -n 32 python flow_past_cylinder.py --Re 421
mpirun -n 32 python flow_past_cylinder.py --Re 422
mpirun -n 32 python flow_past_cylinder.py --Re 423
mpirun -n 32 python flow_past_cylinder.py --Re 424
mpirun -n 32 python flow_past_cylinder.py --Re 425
mpirun -n 32 python flow_past_cylinder.py --Re 426
mpirun -n 32 python flow_past_cylinder.py --Re 427
mpirun -n 32 python flow_past_cylinder.py --Re 428
mpirun -n 32 python flow_past_cylinder.py --Re 429
mpirun -n 32 python flow_past_cylinder.py --Re 430
mpirun -n 32 python flow_past_cylinder.py --Re 431
mpirun -n 32 python flow_past_cylinder.py --Re 432
mpirun -n 32 python flow_past_cylinder.py --Re 433
mpirun -n 32 python flow_past_cylinder.py --Re 434
mpirun -n 32 python flow_past_cylinder.py --Re 435
