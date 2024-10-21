#!/bin/bash
#SBATCH -j fenicsx_8
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 484
mpirun -n 32 python flow_past_cylinder.py --Re 485
mpirun -n 32 python flow_past_cylinder.py --Re 486
mpirun -n 32 python flow_past_cylinder.py --Re 487
mpirun -n 32 python flow_past_cylinder.py --Re 488
mpirun -n 32 python flow_past_cylinder.py --Re 489
mpirun -n 32 python flow_past_cylinder.py --Re 490
mpirun -n 32 python flow_past_cylinder.py --Re 491
mpirun -n 32 python flow_past_cylinder.py --Re 492
mpirun -n 32 python flow_past_cylinder.py --Re 493
mpirun -n 32 python flow_past_cylinder.py --Re 494
mpirun -n 32 python flow_past_cylinder.py --Re 495
mpirun -n 32 python flow_past_cylinder.py --Re 496
mpirun -n 32 python flow_past_cylinder.py --Re 497
mpirun -n 32 python flow_past_cylinder.py --Re 498
mpirun -n 32 python flow_past_cylinder.py --Re 499
mpirun -n 32 python flow_past_cylinder.py --Re 500
mpirun -n 32 python flow_past_cylinder.py --Re 501
mpirun -n 32 python flow_past_cylinder.py --Re 502
mpirun -n 32 python flow_past_cylinder.py --Re 503
mpirun -n 32 python flow_past_cylinder.py --Re 504
mpirun -n 32 python flow_past_cylinder.py --Re 505
mpirun -n 32 python flow_past_cylinder.py --Re 506
mpirun -n 32 python flow_past_cylinder.py --Re 507
mpirun -n 32 python flow_past_cylinder.py --Re 508
mpirun -n 32 python flow_past_cylinder.py --Re 509
mpirun -n 32 python flow_past_cylinder.py --Re 510
mpirun -n 32 python flow_past_cylinder.py --Re 511
mpirun -n 32 python flow_past_cylinder.py --Re 512
mpirun -n 32 python flow_past_cylinder.py --Re 513
mpirun -n 32 python flow_past_cylinder.py --Re 514
mpirun -n 32 python flow_past_cylinder.py --Re 515
mpirun -n 32 python flow_past_cylinder.py --Re 516
mpirun -n 32 python flow_past_cylinder.py --Re 517
mpirun -n 32 python flow_past_cylinder.py --Re 518
mpirun -n 32 python flow_past_cylinder.py --Re 519
mpirun -n 32 python flow_past_cylinder.py --Re 520
mpirun -n 32 python flow_past_cylinder.py --Re 521
mpirun -n 32 python flow_past_cylinder.py --Re 522
mpirun -n 32 python flow_past_cylinder.py --Re 523
mpirun -n 32 python flow_past_cylinder.py --Re 524
mpirun -n 32 python flow_past_cylinder.py --Re 525
mpirun -n 32 python flow_past_cylinder.py --Re 526
mpirun -n 32 python flow_past_cylinder.py --Re 527
mpirun -n 32 python flow_past_cylinder.py --Re 528
mpirun -n 32 python flow_past_cylinder.py --Re 529
mpirun -n 32 python flow_past_cylinder.py --Re 530
mpirun -n 32 python flow_past_cylinder.py --Re 531
