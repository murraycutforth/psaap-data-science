#!/bin/bash
#SBATCH -j fenicsx_10
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 580
mpirun -n 32 python flow_past_cylinder.py --Re 581
mpirun -n 32 python flow_past_cylinder.py --Re 582
mpirun -n 32 python flow_past_cylinder.py --Re 583
mpirun -n 32 python flow_past_cylinder.py --Re 584
mpirun -n 32 python flow_past_cylinder.py --Re 585
mpirun -n 32 python flow_past_cylinder.py --Re 586
mpirun -n 32 python flow_past_cylinder.py --Re 587
mpirun -n 32 python flow_past_cylinder.py --Re 588
mpirun -n 32 python flow_past_cylinder.py --Re 589
mpirun -n 32 python flow_past_cylinder.py --Re 590
mpirun -n 32 python flow_past_cylinder.py --Re 591
mpirun -n 32 python flow_past_cylinder.py --Re 592
mpirun -n 32 python flow_past_cylinder.py --Re 593
mpirun -n 32 python flow_past_cylinder.py --Re 594
mpirun -n 32 python flow_past_cylinder.py --Re 595
mpirun -n 32 python flow_past_cylinder.py --Re 596
mpirun -n 32 python flow_past_cylinder.py --Re 597
mpirun -n 32 python flow_past_cylinder.py --Re 598
mpirun -n 32 python flow_past_cylinder.py --Re 599
mpirun -n 32 python flow_past_cylinder.py --Re 600
mpirun -n 32 python flow_past_cylinder.py --Re 601
mpirun -n 32 python flow_past_cylinder.py --Re 602
mpirun -n 32 python flow_past_cylinder.py --Re 603
mpirun -n 32 python flow_past_cylinder.py --Re 604
mpirun -n 32 python flow_past_cylinder.py --Re 605
mpirun -n 32 python flow_past_cylinder.py --Re 606
mpirun -n 32 python flow_past_cylinder.py --Re 607
mpirun -n 32 python flow_past_cylinder.py --Re 608
mpirun -n 32 python flow_past_cylinder.py --Re 609
mpirun -n 32 python flow_past_cylinder.py --Re 610
mpirun -n 32 python flow_past_cylinder.py --Re 611
mpirun -n 32 python flow_past_cylinder.py --Re 612
mpirun -n 32 python flow_past_cylinder.py --Re 613
mpirun -n 32 python flow_past_cylinder.py --Re 614
mpirun -n 32 python flow_past_cylinder.py --Re 615
mpirun -n 32 python flow_past_cylinder.py --Re 616
mpirun -n 32 python flow_past_cylinder.py --Re 617
mpirun -n 32 python flow_past_cylinder.py --Re 618
mpirun -n 32 python flow_past_cylinder.py --Re 619
mpirun -n 32 python flow_past_cylinder.py --Re 620
mpirun -n 32 python flow_past_cylinder.py --Re 621
mpirun -n 32 python flow_past_cylinder.py --Re 622
mpirun -n 32 python flow_past_cylinder.py --Re 623
mpirun -n 32 python flow_past_cylinder.py --Re 624
mpirun -n 32 python flow_past_cylinder.py --Re 625
mpirun -n 32 python flow_past_cylinder.py --Re 626
mpirun -n 32 python flow_past_cylinder.py --Re 627
