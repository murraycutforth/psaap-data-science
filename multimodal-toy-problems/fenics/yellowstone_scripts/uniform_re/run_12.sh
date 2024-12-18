#!/bin/bash
#SBATCH -J fenicsx_12
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 676
python flow_past_cylinder.py --Re 677
python flow_past_cylinder.py --Re 678
python flow_past_cylinder.py --Re 679
python flow_past_cylinder.py --Re 680
python flow_past_cylinder.py --Re 681
python flow_past_cylinder.py --Re 682
python flow_past_cylinder.py --Re 683
python flow_past_cylinder.py --Re 684
python flow_past_cylinder.py --Re 685
python flow_past_cylinder.py --Re 686
python flow_past_cylinder.py --Re 687
python flow_past_cylinder.py --Re 688
python flow_past_cylinder.py --Re 689
python flow_past_cylinder.py --Re 690
python flow_past_cylinder.py --Re 691
python flow_past_cylinder.py --Re 692
python flow_past_cylinder.py --Re 693
python flow_past_cylinder.py --Re 694
python flow_past_cylinder.py --Re 695
python flow_past_cylinder.py --Re 696
python flow_past_cylinder.py --Re 697
python flow_past_cylinder.py --Re 698
python flow_past_cylinder.py --Re 699
python flow_past_cylinder.py --Re 700
python flow_past_cylinder.py --Re 701
python flow_past_cylinder.py --Re 702
python flow_past_cylinder.py --Re 703
python flow_past_cylinder.py --Re 704
python flow_past_cylinder.py --Re 705
python flow_past_cylinder.py --Re 706
python flow_past_cylinder.py --Re 707
python flow_past_cylinder.py --Re 708
python flow_past_cylinder.py --Re 709
python flow_past_cylinder.py --Re 710
python flow_past_cylinder.py --Re 711
python flow_past_cylinder.py --Re 712
python flow_past_cylinder.py --Re 713
python flow_past_cylinder.py --Re 714
python flow_past_cylinder.py --Re 715
python flow_past_cylinder.py --Re 716
python flow_past_cylinder.py --Re 717
python flow_past_cylinder.py --Re 718
python flow_past_cylinder.py --Re 719
python flow_past_cylinder.py --Re 720
python flow_past_cylinder.py --Re 721
python flow_past_cylinder.py --Re 722
python flow_past_cylinder.py --Re 723
