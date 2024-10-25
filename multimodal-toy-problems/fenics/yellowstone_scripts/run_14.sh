#!/bin/bash
#SBATCH -J fenicsx_14
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 772
python flow_past_cylinder.py --Re 773
python flow_past_cylinder.py --Re 774
python flow_past_cylinder.py --Re 775
python flow_past_cylinder.py --Re 776
python flow_past_cylinder.py --Re 777
python flow_past_cylinder.py --Re 778
python flow_past_cylinder.py --Re 779
python flow_past_cylinder.py --Re 780
python flow_past_cylinder.py --Re 781
python flow_past_cylinder.py --Re 782
python flow_past_cylinder.py --Re 783
python flow_past_cylinder.py --Re 784
python flow_past_cylinder.py --Re 785
python flow_past_cylinder.py --Re 786
python flow_past_cylinder.py --Re 787
python flow_past_cylinder.py --Re 788
python flow_past_cylinder.py --Re 789
python flow_past_cylinder.py --Re 790
python flow_past_cylinder.py --Re 791
python flow_past_cylinder.py --Re 792
python flow_past_cylinder.py --Re 793
python flow_past_cylinder.py --Re 794
python flow_past_cylinder.py --Re 795
python flow_past_cylinder.py --Re 796
python flow_past_cylinder.py --Re 797
python flow_past_cylinder.py --Re 798
python flow_past_cylinder.py --Re 799
python flow_past_cylinder.py --Re 800
python flow_past_cylinder.py --Re 801
python flow_past_cylinder.py --Re 802
python flow_past_cylinder.py --Re 803
python flow_past_cylinder.py --Re 804
python flow_past_cylinder.py --Re 805
python flow_past_cylinder.py --Re 806
python flow_past_cylinder.py --Re 807
python flow_past_cylinder.py --Re 808
python flow_past_cylinder.py --Re 809
python flow_past_cylinder.py --Re 810
python flow_past_cylinder.py --Re 811
python flow_past_cylinder.py --Re 812
python flow_past_cylinder.py --Re 813
python flow_past_cylinder.py --Re 814
python flow_past_cylinder.py --Re 815
python flow_past_cylinder.py --Re 816
python flow_past_cylinder.py --Re 817
python flow_past_cylinder.py --Re 818
python flow_past_cylinder.py --Re 819
