#!/bin/bash
#SBATCH -j fenicsx_16
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 868
mpirun -n 32 python flow_past_cylinder.py --Re 869
mpirun -n 32 python flow_past_cylinder.py --Re 870
mpirun -n 32 python flow_past_cylinder.py --Re 871
mpirun -n 32 python flow_past_cylinder.py --Re 872
mpirun -n 32 python flow_past_cylinder.py --Re 873
mpirun -n 32 python flow_past_cylinder.py --Re 874
mpirun -n 32 python flow_past_cylinder.py --Re 875
mpirun -n 32 python flow_past_cylinder.py --Re 876
mpirun -n 32 python flow_past_cylinder.py --Re 877
mpirun -n 32 python flow_past_cylinder.py --Re 878
mpirun -n 32 python flow_past_cylinder.py --Re 879
mpirun -n 32 python flow_past_cylinder.py --Re 880
mpirun -n 32 python flow_past_cylinder.py --Re 881
mpirun -n 32 python flow_past_cylinder.py --Re 882
mpirun -n 32 python flow_past_cylinder.py --Re 883
mpirun -n 32 python flow_past_cylinder.py --Re 884
mpirun -n 32 python flow_past_cylinder.py --Re 885
mpirun -n 32 python flow_past_cylinder.py --Re 886
mpirun -n 32 python flow_past_cylinder.py --Re 887
mpirun -n 32 python flow_past_cylinder.py --Re 888
mpirun -n 32 python flow_past_cylinder.py --Re 889
mpirun -n 32 python flow_past_cylinder.py --Re 890
mpirun -n 32 python flow_past_cylinder.py --Re 891
mpirun -n 32 python flow_past_cylinder.py --Re 892
mpirun -n 32 python flow_past_cylinder.py --Re 893
mpirun -n 32 python flow_past_cylinder.py --Re 894
mpirun -n 32 python flow_past_cylinder.py --Re 895
mpirun -n 32 python flow_past_cylinder.py --Re 896
mpirun -n 32 python flow_past_cylinder.py --Re 897
mpirun -n 32 python flow_past_cylinder.py --Re 898
mpirun -n 32 python flow_past_cylinder.py --Re 899
mpirun -n 32 python flow_past_cylinder.py --Re 900
mpirun -n 32 python flow_past_cylinder.py --Re 901
mpirun -n 32 python flow_past_cylinder.py --Re 902
mpirun -n 32 python flow_past_cylinder.py --Re 903
mpirun -n 32 python flow_past_cylinder.py --Re 904
mpirun -n 32 python flow_past_cylinder.py --Re 905
mpirun -n 32 python flow_past_cylinder.py --Re 906
mpirun -n 32 python flow_past_cylinder.py --Re 907
mpirun -n 32 python flow_past_cylinder.py --Re 908
mpirun -n 32 python flow_past_cylinder.py --Re 909
mpirun -n 32 python flow_past_cylinder.py --Re 910
mpirun -n 32 python flow_past_cylinder.py --Re 911
mpirun -n 32 python flow_past_cylinder.py --Re 912
mpirun -n 32 python flow_past_cylinder.py --Re 913
mpirun -n 32 python flow_past_cylinder.py --Re 914
mpirun -n 32 python flow_past_cylinder.py --Re 915
