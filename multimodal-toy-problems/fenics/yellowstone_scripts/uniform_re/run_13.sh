#!/bin/bash
#SBATCH -J fenicsx_13
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 724
python flow_past_cylinder.py --Re 725
python flow_past_cylinder.py --Re 726
python flow_past_cylinder.py --Re 727
python flow_past_cylinder.py --Re 728
python flow_past_cylinder.py --Re 729
python flow_past_cylinder.py --Re 730
python flow_past_cylinder.py --Re 731
python flow_past_cylinder.py --Re 732
python flow_past_cylinder.py --Re 733
python flow_past_cylinder.py --Re 734
python flow_past_cylinder.py --Re 735
python flow_past_cylinder.py --Re 736
python flow_past_cylinder.py --Re 737
python flow_past_cylinder.py --Re 738
python flow_past_cylinder.py --Re 739
python flow_past_cylinder.py --Re 740
python flow_past_cylinder.py --Re 741
python flow_past_cylinder.py --Re 742
python flow_past_cylinder.py --Re 743
python flow_past_cylinder.py --Re 744
python flow_past_cylinder.py --Re 745
python flow_past_cylinder.py --Re 746
python flow_past_cylinder.py --Re 747
python flow_past_cylinder.py --Re 748
python flow_past_cylinder.py --Re 749
python flow_past_cylinder.py --Re 750
python flow_past_cylinder.py --Re 751
python flow_past_cylinder.py --Re 752
python flow_past_cylinder.py --Re 753
python flow_past_cylinder.py --Re 754
python flow_past_cylinder.py --Re 755
python flow_past_cylinder.py --Re 756
python flow_past_cylinder.py --Re 757
python flow_past_cylinder.py --Re 758
python flow_past_cylinder.py --Re 759
python flow_past_cylinder.py --Re 760
python flow_past_cylinder.py --Re 761
python flow_past_cylinder.py --Re 762
python flow_past_cylinder.py --Re 763
python flow_past_cylinder.py --Re 764
python flow_past_cylinder.py --Re 765
python flow_past_cylinder.py --Re 766
python flow_past_cylinder.py --Re 767
python flow_past_cylinder.py --Re 768
python flow_past_cylinder.py --Re 769
python flow_past_cylinder.py --Re 770
python flow_past_cylinder.py --Re 771
