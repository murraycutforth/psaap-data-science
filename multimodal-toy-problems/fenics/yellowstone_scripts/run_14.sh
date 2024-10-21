#!/bin/bash
#SBATCH -j fenicsx_14
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 772
mpirun -n 32 python flow_past_cylinder.py --Re 773
mpirun -n 32 python flow_past_cylinder.py --Re 774
mpirun -n 32 python flow_past_cylinder.py --Re 775
mpirun -n 32 python flow_past_cylinder.py --Re 776
mpirun -n 32 python flow_past_cylinder.py --Re 777
mpirun -n 32 python flow_past_cylinder.py --Re 778
mpirun -n 32 python flow_past_cylinder.py --Re 779
mpirun -n 32 python flow_past_cylinder.py --Re 780
mpirun -n 32 python flow_past_cylinder.py --Re 781
mpirun -n 32 python flow_past_cylinder.py --Re 782
mpirun -n 32 python flow_past_cylinder.py --Re 783
mpirun -n 32 python flow_past_cylinder.py --Re 784
mpirun -n 32 python flow_past_cylinder.py --Re 785
mpirun -n 32 python flow_past_cylinder.py --Re 786
mpirun -n 32 python flow_past_cylinder.py --Re 787
mpirun -n 32 python flow_past_cylinder.py --Re 788
mpirun -n 32 python flow_past_cylinder.py --Re 789
mpirun -n 32 python flow_past_cylinder.py --Re 790
mpirun -n 32 python flow_past_cylinder.py --Re 791
mpirun -n 32 python flow_past_cylinder.py --Re 792
mpirun -n 32 python flow_past_cylinder.py --Re 793
mpirun -n 32 python flow_past_cylinder.py --Re 794
mpirun -n 32 python flow_past_cylinder.py --Re 795
mpirun -n 32 python flow_past_cylinder.py --Re 796
mpirun -n 32 python flow_past_cylinder.py --Re 797
mpirun -n 32 python flow_past_cylinder.py --Re 798
mpirun -n 32 python flow_past_cylinder.py --Re 799
mpirun -n 32 python flow_past_cylinder.py --Re 800
mpirun -n 32 python flow_past_cylinder.py --Re 801
mpirun -n 32 python flow_past_cylinder.py --Re 802
mpirun -n 32 python flow_past_cylinder.py --Re 803
mpirun -n 32 python flow_past_cylinder.py --Re 804
mpirun -n 32 python flow_past_cylinder.py --Re 805
mpirun -n 32 python flow_past_cylinder.py --Re 806
mpirun -n 32 python flow_past_cylinder.py --Re 807
mpirun -n 32 python flow_past_cylinder.py --Re 808
mpirun -n 32 python flow_past_cylinder.py --Re 809
mpirun -n 32 python flow_past_cylinder.py --Re 810
mpirun -n 32 python flow_past_cylinder.py --Re 811
mpirun -n 32 python flow_past_cylinder.py --Re 812
mpirun -n 32 python flow_past_cylinder.py --Re 813
mpirun -n 32 python flow_past_cylinder.py --Re 814
mpirun -n 32 python flow_past_cylinder.py --Re 815
mpirun -n 32 python flow_past_cylinder.py --Re 816
mpirun -n 32 python flow_past_cylinder.py --Re 817
mpirun -n 32 python flow_past_cylinder.py --Re 818
mpirun -n 32 python flow_past_cylinder.py --Re 819
