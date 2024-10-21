#!/bin/bash
#SBATCH -j fenicsx_9
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 532
mpirun -n 32 python flow_past_cylinder.py --Re 533
mpirun -n 32 python flow_past_cylinder.py --Re 534
mpirun -n 32 python flow_past_cylinder.py --Re 535
mpirun -n 32 python flow_past_cylinder.py --Re 536
mpirun -n 32 python flow_past_cylinder.py --Re 537
mpirun -n 32 python flow_past_cylinder.py --Re 538
mpirun -n 32 python flow_past_cylinder.py --Re 539
mpirun -n 32 python flow_past_cylinder.py --Re 540
mpirun -n 32 python flow_past_cylinder.py --Re 541
mpirun -n 32 python flow_past_cylinder.py --Re 542
mpirun -n 32 python flow_past_cylinder.py --Re 543
mpirun -n 32 python flow_past_cylinder.py --Re 544
mpirun -n 32 python flow_past_cylinder.py --Re 545
mpirun -n 32 python flow_past_cylinder.py --Re 546
mpirun -n 32 python flow_past_cylinder.py --Re 547
mpirun -n 32 python flow_past_cylinder.py --Re 548
mpirun -n 32 python flow_past_cylinder.py --Re 549
mpirun -n 32 python flow_past_cylinder.py --Re 550
mpirun -n 32 python flow_past_cylinder.py --Re 551
mpirun -n 32 python flow_past_cylinder.py --Re 552
mpirun -n 32 python flow_past_cylinder.py --Re 553
mpirun -n 32 python flow_past_cylinder.py --Re 554
mpirun -n 32 python flow_past_cylinder.py --Re 555
mpirun -n 32 python flow_past_cylinder.py --Re 556
mpirun -n 32 python flow_past_cylinder.py --Re 557
mpirun -n 32 python flow_past_cylinder.py --Re 558
mpirun -n 32 python flow_past_cylinder.py --Re 559
mpirun -n 32 python flow_past_cylinder.py --Re 560
mpirun -n 32 python flow_past_cylinder.py --Re 561
mpirun -n 32 python flow_past_cylinder.py --Re 562
mpirun -n 32 python flow_past_cylinder.py --Re 563
mpirun -n 32 python flow_past_cylinder.py --Re 564
mpirun -n 32 python flow_past_cylinder.py --Re 565
mpirun -n 32 python flow_past_cylinder.py --Re 566
mpirun -n 32 python flow_past_cylinder.py --Re 567
mpirun -n 32 python flow_past_cylinder.py --Re 568
mpirun -n 32 python flow_past_cylinder.py --Re 569
mpirun -n 32 python flow_past_cylinder.py --Re 570
mpirun -n 32 python flow_past_cylinder.py --Re 571
mpirun -n 32 python flow_past_cylinder.py --Re 572
mpirun -n 32 python flow_past_cylinder.py --Re 573
mpirun -n 32 python flow_past_cylinder.py --Re 574
mpirun -n 32 python flow_past_cylinder.py --Re 575
mpirun -n 32 python flow_past_cylinder.py --Re 576
mpirun -n 32 python flow_past_cylinder.py --Re 577
mpirun -n 32 python flow_past_cylinder.py --Re 578
mpirun -n 32 python flow_past_cylinder.py --Re 579
