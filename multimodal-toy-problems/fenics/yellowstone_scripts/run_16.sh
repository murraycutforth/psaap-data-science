#!/bin/bash
#SBATCH -J fenicsx_16
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 868
python flow_past_cylinder.py --Re 869
python flow_past_cylinder.py --Re 870
python flow_past_cylinder.py --Re 871
python flow_past_cylinder.py --Re 872
python flow_past_cylinder.py --Re 873
python flow_past_cylinder.py --Re 874
python flow_past_cylinder.py --Re 875
python flow_past_cylinder.py --Re 876
python flow_past_cylinder.py --Re 877
python flow_past_cylinder.py --Re 878
python flow_past_cylinder.py --Re 879
python flow_past_cylinder.py --Re 880
python flow_past_cylinder.py --Re 881
python flow_past_cylinder.py --Re 882
python flow_past_cylinder.py --Re 883
python flow_past_cylinder.py --Re 884
python flow_past_cylinder.py --Re 885
python flow_past_cylinder.py --Re 886
python flow_past_cylinder.py --Re 887
python flow_past_cylinder.py --Re 888
python flow_past_cylinder.py --Re 889
python flow_past_cylinder.py --Re 890
python flow_past_cylinder.py --Re 891
python flow_past_cylinder.py --Re 892
python flow_past_cylinder.py --Re 893
python flow_past_cylinder.py --Re 894
python flow_past_cylinder.py --Re 895
python flow_past_cylinder.py --Re 896
python flow_past_cylinder.py --Re 897
python flow_past_cylinder.py --Re 898
python flow_past_cylinder.py --Re 899
python flow_past_cylinder.py --Re 900
python flow_past_cylinder.py --Re 901
python flow_past_cylinder.py --Re 902
python flow_past_cylinder.py --Re 903
python flow_past_cylinder.py --Re 904
python flow_past_cylinder.py --Re 905
python flow_past_cylinder.py --Re 906
python flow_past_cylinder.py --Re 907
python flow_past_cylinder.py --Re 908
python flow_past_cylinder.py --Re 909
python flow_past_cylinder.py --Re 910
python flow_past_cylinder.py --Re 911
python flow_past_cylinder.py --Re 912
python flow_past_cylinder.py --Re 913
python flow_past_cylinder.py --Re 914
python flow_past_cylinder.py --Re 915
