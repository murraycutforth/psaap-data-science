#!/bin/bash
#SBATCH -j fenicsx_11
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 628
mpirun -n 32 python flow_past_cylinder.py --Re 629
mpirun -n 32 python flow_past_cylinder.py --Re 630
mpirun -n 32 python flow_past_cylinder.py --Re 631
mpirun -n 32 python flow_past_cylinder.py --Re 632
mpirun -n 32 python flow_past_cylinder.py --Re 633
mpirun -n 32 python flow_past_cylinder.py --Re 634
mpirun -n 32 python flow_past_cylinder.py --Re 635
mpirun -n 32 python flow_past_cylinder.py --Re 636
mpirun -n 32 python flow_past_cylinder.py --Re 637
mpirun -n 32 python flow_past_cylinder.py --Re 638
mpirun -n 32 python flow_past_cylinder.py --Re 639
mpirun -n 32 python flow_past_cylinder.py --Re 640
mpirun -n 32 python flow_past_cylinder.py --Re 641
mpirun -n 32 python flow_past_cylinder.py --Re 642
mpirun -n 32 python flow_past_cylinder.py --Re 643
mpirun -n 32 python flow_past_cylinder.py --Re 644
mpirun -n 32 python flow_past_cylinder.py --Re 645
mpirun -n 32 python flow_past_cylinder.py --Re 646
mpirun -n 32 python flow_past_cylinder.py --Re 647
mpirun -n 32 python flow_past_cylinder.py --Re 648
mpirun -n 32 python flow_past_cylinder.py --Re 649
mpirun -n 32 python flow_past_cylinder.py --Re 650
mpirun -n 32 python flow_past_cylinder.py --Re 651
mpirun -n 32 python flow_past_cylinder.py --Re 652
mpirun -n 32 python flow_past_cylinder.py --Re 653
mpirun -n 32 python flow_past_cylinder.py --Re 654
mpirun -n 32 python flow_past_cylinder.py --Re 655
mpirun -n 32 python flow_past_cylinder.py --Re 656
mpirun -n 32 python flow_past_cylinder.py --Re 657
mpirun -n 32 python flow_past_cylinder.py --Re 658
mpirun -n 32 python flow_past_cylinder.py --Re 659
mpirun -n 32 python flow_past_cylinder.py --Re 660
mpirun -n 32 python flow_past_cylinder.py --Re 661
mpirun -n 32 python flow_past_cylinder.py --Re 662
mpirun -n 32 python flow_past_cylinder.py --Re 663
mpirun -n 32 python flow_past_cylinder.py --Re 664
mpirun -n 32 python flow_past_cylinder.py --Re 665
mpirun -n 32 python flow_past_cylinder.py --Re 666
mpirun -n 32 python flow_past_cylinder.py --Re 667
mpirun -n 32 python flow_past_cylinder.py --Re 668
mpirun -n 32 python flow_past_cylinder.py --Re 669
mpirun -n 32 python flow_past_cylinder.py --Re 670
mpirun -n 32 python flow_past_cylinder.py --Re 671
mpirun -n 32 python flow_past_cylinder.py --Re 672
mpirun -n 32 python flow_past_cylinder.py --Re 673
mpirun -n 32 python flow_past_cylinder.py --Re 674
mpirun -n 32 python flow_past_cylinder.py --Re 675
