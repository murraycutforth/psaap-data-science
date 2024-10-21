#!/bin/bash
#SBATCH -j fenicsx_12
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 676
mpirun -n 32 python flow_past_cylinder.py --Re 677
mpirun -n 32 python flow_past_cylinder.py --Re 678
mpirun -n 32 python flow_past_cylinder.py --Re 679
mpirun -n 32 python flow_past_cylinder.py --Re 680
mpirun -n 32 python flow_past_cylinder.py --Re 681
mpirun -n 32 python flow_past_cylinder.py --Re 682
mpirun -n 32 python flow_past_cylinder.py --Re 683
mpirun -n 32 python flow_past_cylinder.py --Re 684
mpirun -n 32 python flow_past_cylinder.py --Re 685
mpirun -n 32 python flow_past_cylinder.py --Re 686
mpirun -n 32 python flow_past_cylinder.py --Re 687
mpirun -n 32 python flow_past_cylinder.py --Re 688
mpirun -n 32 python flow_past_cylinder.py --Re 689
mpirun -n 32 python flow_past_cylinder.py --Re 690
mpirun -n 32 python flow_past_cylinder.py --Re 691
mpirun -n 32 python flow_past_cylinder.py --Re 692
mpirun -n 32 python flow_past_cylinder.py --Re 693
mpirun -n 32 python flow_past_cylinder.py --Re 694
mpirun -n 32 python flow_past_cylinder.py --Re 695
mpirun -n 32 python flow_past_cylinder.py --Re 696
mpirun -n 32 python flow_past_cylinder.py --Re 697
mpirun -n 32 python flow_past_cylinder.py --Re 698
mpirun -n 32 python flow_past_cylinder.py --Re 699
mpirun -n 32 python flow_past_cylinder.py --Re 700
mpirun -n 32 python flow_past_cylinder.py --Re 701
mpirun -n 32 python flow_past_cylinder.py --Re 702
mpirun -n 32 python flow_past_cylinder.py --Re 703
mpirun -n 32 python flow_past_cylinder.py --Re 704
mpirun -n 32 python flow_past_cylinder.py --Re 705
mpirun -n 32 python flow_past_cylinder.py --Re 706
mpirun -n 32 python flow_past_cylinder.py --Re 707
mpirun -n 32 python flow_past_cylinder.py --Re 708
mpirun -n 32 python flow_past_cylinder.py --Re 709
mpirun -n 32 python flow_past_cylinder.py --Re 710
mpirun -n 32 python flow_past_cylinder.py --Re 711
mpirun -n 32 python flow_past_cylinder.py --Re 712
mpirun -n 32 python flow_past_cylinder.py --Re 713
mpirun -n 32 python flow_past_cylinder.py --Re 714
mpirun -n 32 python flow_past_cylinder.py --Re 715
mpirun -n 32 python flow_past_cylinder.py --Re 716
mpirun -n 32 python flow_past_cylinder.py --Re 717
mpirun -n 32 python flow_past_cylinder.py --Re 718
mpirun -n 32 python flow_past_cylinder.py --Re 719
mpirun -n 32 python flow_past_cylinder.py --Re 720
mpirun -n 32 python flow_past_cylinder.py --Re 721
mpirun -n 32 python flow_past_cylinder.py --Re 722
mpirun -n 32 python flow_past_cylinder.py --Re 723
