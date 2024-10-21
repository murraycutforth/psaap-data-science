#!/bin/bash
#SBATCH -j fenicsx_15
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 820
mpirun -n 32 python flow_past_cylinder.py --Re 821
mpirun -n 32 python flow_past_cylinder.py --Re 822
mpirun -n 32 python flow_past_cylinder.py --Re 823
mpirun -n 32 python flow_past_cylinder.py --Re 824
mpirun -n 32 python flow_past_cylinder.py --Re 825
mpirun -n 32 python flow_past_cylinder.py --Re 826
mpirun -n 32 python flow_past_cylinder.py --Re 827
mpirun -n 32 python flow_past_cylinder.py --Re 828
mpirun -n 32 python flow_past_cylinder.py --Re 829
mpirun -n 32 python flow_past_cylinder.py --Re 830
mpirun -n 32 python flow_past_cylinder.py --Re 831
mpirun -n 32 python flow_past_cylinder.py --Re 832
mpirun -n 32 python flow_past_cylinder.py --Re 833
mpirun -n 32 python flow_past_cylinder.py --Re 834
mpirun -n 32 python flow_past_cylinder.py --Re 835
mpirun -n 32 python flow_past_cylinder.py --Re 836
mpirun -n 32 python flow_past_cylinder.py --Re 837
mpirun -n 32 python flow_past_cylinder.py --Re 838
mpirun -n 32 python flow_past_cylinder.py --Re 839
mpirun -n 32 python flow_past_cylinder.py --Re 840
mpirun -n 32 python flow_past_cylinder.py --Re 841
mpirun -n 32 python flow_past_cylinder.py --Re 842
mpirun -n 32 python flow_past_cylinder.py --Re 843
mpirun -n 32 python flow_past_cylinder.py --Re 844
mpirun -n 32 python flow_past_cylinder.py --Re 845
mpirun -n 32 python flow_past_cylinder.py --Re 846
mpirun -n 32 python flow_past_cylinder.py --Re 847
mpirun -n 32 python flow_past_cylinder.py --Re 848
mpirun -n 32 python flow_past_cylinder.py --Re 849
mpirun -n 32 python flow_past_cylinder.py --Re 850
mpirun -n 32 python flow_past_cylinder.py --Re 851
mpirun -n 32 python flow_past_cylinder.py --Re 852
mpirun -n 32 python flow_past_cylinder.py --Re 853
mpirun -n 32 python flow_past_cylinder.py --Re 854
mpirun -n 32 python flow_past_cylinder.py --Re 855
mpirun -n 32 python flow_past_cylinder.py --Re 856
mpirun -n 32 python flow_past_cylinder.py --Re 857
mpirun -n 32 python flow_past_cylinder.py --Re 858
mpirun -n 32 python flow_past_cylinder.py --Re 859
mpirun -n 32 python flow_past_cylinder.py --Re 860
mpirun -n 32 python flow_past_cylinder.py --Re 861
mpirun -n 32 python flow_past_cylinder.py --Re 862
mpirun -n 32 python flow_past_cylinder.py --Re 863
mpirun -n 32 python flow_past_cylinder.py --Re 864
mpirun -n 32 python flow_past_cylinder.py --Re 865
mpirun -n 32 python flow_past_cylinder.py --Re 866
mpirun -n 32 python flow_past_cylinder.py --Re 867
