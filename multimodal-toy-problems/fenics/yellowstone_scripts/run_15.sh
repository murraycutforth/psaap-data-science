#!/bin/bash
#SBATCH -J fenicsx_15
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 820
python flow_past_cylinder.py --Re 821
python flow_past_cylinder.py --Re 822
python flow_past_cylinder.py --Re 823
python flow_past_cylinder.py --Re 824
python flow_past_cylinder.py --Re 825
python flow_past_cylinder.py --Re 826
python flow_past_cylinder.py --Re 827
python flow_past_cylinder.py --Re 828
python flow_past_cylinder.py --Re 829
python flow_past_cylinder.py --Re 830
python flow_past_cylinder.py --Re 831
python flow_past_cylinder.py --Re 832
python flow_past_cylinder.py --Re 833
python flow_past_cylinder.py --Re 834
python flow_past_cylinder.py --Re 835
python flow_past_cylinder.py --Re 836
python flow_past_cylinder.py --Re 837
python flow_past_cylinder.py --Re 838
python flow_past_cylinder.py --Re 839
python flow_past_cylinder.py --Re 840
python flow_past_cylinder.py --Re 841
python flow_past_cylinder.py --Re 842
python flow_past_cylinder.py --Re 843
python flow_past_cylinder.py --Re 844
python flow_past_cylinder.py --Re 845
python flow_past_cylinder.py --Re 846
python flow_past_cylinder.py --Re 847
python flow_past_cylinder.py --Re 848
python flow_past_cylinder.py --Re 849
python flow_past_cylinder.py --Re 850
python flow_past_cylinder.py --Re 851
python flow_past_cylinder.py --Re 852
python flow_past_cylinder.py --Re 853
python flow_past_cylinder.py --Re 854
python flow_past_cylinder.py --Re 855
python flow_past_cylinder.py --Re 856
python flow_past_cylinder.py --Re 857
python flow_past_cylinder.py --Re 858
python flow_past_cylinder.py --Re 859
python flow_past_cylinder.py --Re 860
python flow_past_cylinder.py --Re 861
python flow_past_cylinder.py --Re 862
python flow_past_cylinder.py --Re 863
python flow_past_cylinder.py --Re 864
python flow_past_cylinder.py --Re 865
python flow_past_cylinder.py --Re 866
python flow_past_cylinder.py --Re 867
