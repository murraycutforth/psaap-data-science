#!/bin/bash
#SBATCH -J fenicsx_11
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 628
python flow_past_cylinder.py --Re 629
python flow_past_cylinder.py --Re 630
python flow_past_cylinder.py --Re 631
python flow_past_cylinder.py --Re 632
python flow_past_cylinder.py --Re 633
python flow_past_cylinder.py --Re 634
python flow_past_cylinder.py --Re 635
python flow_past_cylinder.py --Re 636
python flow_past_cylinder.py --Re 637
python flow_past_cylinder.py --Re 638
python flow_past_cylinder.py --Re 639
python flow_past_cylinder.py --Re 640
python flow_past_cylinder.py --Re 641
python flow_past_cylinder.py --Re 642
python flow_past_cylinder.py --Re 643
python flow_past_cylinder.py --Re 644
python flow_past_cylinder.py --Re 645
python flow_past_cylinder.py --Re 646
python flow_past_cylinder.py --Re 647
python flow_past_cylinder.py --Re 648
python flow_past_cylinder.py --Re 649
python flow_past_cylinder.py --Re 650
python flow_past_cylinder.py --Re 651
python flow_past_cylinder.py --Re 652
python flow_past_cylinder.py --Re 653
python flow_past_cylinder.py --Re 654
python flow_past_cylinder.py --Re 655
python flow_past_cylinder.py --Re 656
python flow_past_cylinder.py --Re 657
python flow_past_cylinder.py --Re 658
python flow_past_cylinder.py --Re 659
python flow_past_cylinder.py --Re 660
python flow_past_cylinder.py --Re 661
python flow_past_cylinder.py --Re 662
python flow_past_cylinder.py --Re 663
python flow_past_cylinder.py --Re 664
python flow_past_cylinder.py --Re 665
python flow_past_cylinder.py --Re 666
python flow_past_cylinder.py --Re 667
python flow_past_cylinder.py --Re 668
python flow_past_cylinder.py --Re 669
python flow_past_cylinder.py --Re 670
python flow_past_cylinder.py --Re 671
python flow_past_cylinder.py --Re 672
python flow_past_cylinder.py --Re 673
python flow_past_cylinder.py --Re 674
python flow_past_cylinder.py --Re 675
