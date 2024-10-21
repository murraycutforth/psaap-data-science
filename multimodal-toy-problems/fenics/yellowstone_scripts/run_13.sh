#!/bin/bash
#SBATCH -J fenicsx_13
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 724
mpirun -n 32 python flow_past_cylinder.py --Re 725
mpirun -n 32 python flow_past_cylinder.py --Re 726
mpirun -n 32 python flow_past_cylinder.py --Re 727
mpirun -n 32 python flow_past_cylinder.py --Re 728
mpirun -n 32 python flow_past_cylinder.py --Re 729
mpirun -n 32 python flow_past_cylinder.py --Re 730
mpirun -n 32 python flow_past_cylinder.py --Re 731
mpirun -n 32 python flow_past_cylinder.py --Re 732
mpirun -n 32 python flow_past_cylinder.py --Re 733
mpirun -n 32 python flow_past_cylinder.py --Re 734
mpirun -n 32 python flow_past_cylinder.py --Re 735
mpirun -n 32 python flow_past_cylinder.py --Re 736
mpirun -n 32 python flow_past_cylinder.py --Re 737
mpirun -n 32 python flow_past_cylinder.py --Re 738
mpirun -n 32 python flow_past_cylinder.py --Re 739
mpirun -n 32 python flow_past_cylinder.py --Re 740
mpirun -n 32 python flow_past_cylinder.py --Re 741
mpirun -n 32 python flow_past_cylinder.py --Re 742
mpirun -n 32 python flow_past_cylinder.py --Re 743
mpirun -n 32 python flow_past_cylinder.py --Re 744
mpirun -n 32 python flow_past_cylinder.py --Re 745
mpirun -n 32 python flow_past_cylinder.py --Re 746
mpirun -n 32 python flow_past_cylinder.py --Re 747
mpirun -n 32 python flow_past_cylinder.py --Re 748
mpirun -n 32 python flow_past_cylinder.py --Re 749
mpirun -n 32 python flow_past_cylinder.py --Re 750
mpirun -n 32 python flow_past_cylinder.py --Re 751
mpirun -n 32 python flow_past_cylinder.py --Re 752
mpirun -n 32 python flow_past_cylinder.py --Re 753
mpirun -n 32 python flow_past_cylinder.py --Re 754
mpirun -n 32 python flow_past_cylinder.py --Re 755
mpirun -n 32 python flow_past_cylinder.py --Re 756
mpirun -n 32 python flow_past_cylinder.py --Re 757
mpirun -n 32 python flow_past_cylinder.py --Re 758
mpirun -n 32 python flow_past_cylinder.py --Re 759
mpirun -n 32 python flow_past_cylinder.py --Re 760
mpirun -n 32 python flow_past_cylinder.py --Re 761
mpirun -n 32 python flow_past_cylinder.py --Re 762
mpirun -n 32 python flow_past_cylinder.py --Re 763
mpirun -n 32 python flow_past_cylinder.py --Re 764
mpirun -n 32 python flow_past_cylinder.py --Re 765
mpirun -n 32 python flow_past_cylinder.py --Re 766
mpirun -n 32 python flow_past_cylinder.py --Re 767
mpirun -n 32 python flow_past_cylinder.py --Re 768
mpirun -n 32 python flow_past_cylinder.py --Re 769
mpirun -n 32 python flow_past_cylinder.py --Re 770
mpirun -n 32 python flow_past_cylinder.py --Re 771
