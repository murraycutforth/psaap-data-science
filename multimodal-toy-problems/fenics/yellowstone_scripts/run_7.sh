#!/bin/bash
#SBATCH -J fenicsx_7
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 436
mpirun -n 32 python flow_past_cylinder.py --Re 437
mpirun -n 32 python flow_past_cylinder.py --Re 438
mpirun -n 32 python flow_past_cylinder.py --Re 439
mpirun -n 32 python flow_past_cylinder.py --Re 440
mpirun -n 32 python flow_past_cylinder.py --Re 441
mpirun -n 32 python flow_past_cylinder.py --Re 442
mpirun -n 32 python flow_past_cylinder.py --Re 443
mpirun -n 32 python flow_past_cylinder.py --Re 444
mpirun -n 32 python flow_past_cylinder.py --Re 445
mpirun -n 32 python flow_past_cylinder.py --Re 446
mpirun -n 32 python flow_past_cylinder.py --Re 447
mpirun -n 32 python flow_past_cylinder.py --Re 448
mpirun -n 32 python flow_past_cylinder.py --Re 449
mpirun -n 32 python flow_past_cylinder.py --Re 450
mpirun -n 32 python flow_past_cylinder.py --Re 451
mpirun -n 32 python flow_past_cylinder.py --Re 452
mpirun -n 32 python flow_past_cylinder.py --Re 453
mpirun -n 32 python flow_past_cylinder.py --Re 454
mpirun -n 32 python flow_past_cylinder.py --Re 455
mpirun -n 32 python flow_past_cylinder.py --Re 456
mpirun -n 32 python flow_past_cylinder.py --Re 457
mpirun -n 32 python flow_past_cylinder.py --Re 458
mpirun -n 32 python flow_past_cylinder.py --Re 459
mpirun -n 32 python flow_past_cylinder.py --Re 460
mpirun -n 32 python flow_past_cylinder.py --Re 461
mpirun -n 32 python flow_past_cylinder.py --Re 462
mpirun -n 32 python flow_past_cylinder.py --Re 463
mpirun -n 32 python flow_past_cylinder.py --Re 464
mpirun -n 32 python flow_past_cylinder.py --Re 465
mpirun -n 32 python flow_past_cylinder.py --Re 466
mpirun -n 32 python flow_past_cylinder.py --Re 467
mpirun -n 32 python flow_past_cylinder.py --Re 468
mpirun -n 32 python flow_past_cylinder.py --Re 469
mpirun -n 32 python flow_past_cylinder.py --Re 470
mpirun -n 32 python flow_past_cylinder.py --Re 471
mpirun -n 32 python flow_past_cylinder.py --Re 472
mpirun -n 32 python flow_past_cylinder.py --Re 473
mpirun -n 32 python flow_past_cylinder.py --Re 474
mpirun -n 32 python flow_past_cylinder.py --Re 475
mpirun -n 32 python flow_past_cylinder.py --Re 476
mpirun -n 32 python flow_past_cylinder.py --Re 477
mpirun -n 32 python flow_past_cylinder.py --Re 478
mpirun -n 32 python flow_past_cylinder.py --Re 479
mpirun -n 32 python flow_past_cylinder.py --Re 480
mpirun -n 32 python flow_past_cylinder.py --Re 481
mpirun -n 32 python flow_past_cylinder.py --Re 482
mpirun -n 32 python flow_past_cylinder.py --Re 483
