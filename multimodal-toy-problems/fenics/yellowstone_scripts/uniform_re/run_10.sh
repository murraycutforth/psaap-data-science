#!/bin/bash
#SBATCH -J fenicsx_10
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 580
python flow_past_cylinder.py --Re 581
python flow_past_cylinder.py --Re 582
python flow_past_cylinder.py --Re 583
python flow_past_cylinder.py --Re 584
python flow_past_cylinder.py --Re 585
python flow_past_cylinder.py --Re 586
python flow_past_cylinder.py --Re 587
python flow_past_cylinder.py --Re 588
python flow_past_cylinder.py --Re 589
python flow_past_cylinder.py --Re 590
python flow_past_cylinder.py --Re 591
python flow_past_cylinder.py --Re 592
python flow_past_cylinder.py --Re 593
python flow_past_cylinder.py --Re 594
python flow_past_cylinder.py --Re 595
python flow_past_cylinder.py --Re 596
python flow_past_cylinder.py --Re 597
python flow_past_cylinder.py --Re 598
python flow_past_cylinder.py --Re 599
python flow_past_cylinder.py --Re 600
python flow_past_cylinder.py --Re 601
python flow_past_cylinder.py --Re 602
python flow_past_cylinder.py --Re 603
python flow_past_cylinder.py --Re 604
python flow_past_cylinder.py --Re 605
python flow_past_cylinder.py --Re 606
python flow_past_cylinder.py --Re 607
python flow_past_cylinder.py --Re 608
python flow_past_cylinder.py --Re 609
python flow_past_cylinder.py --Re 610
python flow_past_cylinder.py --Re 611
python flow_past_cylinder.py --Re 612
python flow_past_cylinder.py --Re 613
python flow_past_cylinder.py --Re 614
python flow_past_cylinder.py --Re 615
python flow_past_cylinder.py --Re 616
python flow_past_cylinder.py --Re 617
python flow_past_cylinder.py --Re 618
python flow_past_cylinder.py --Re 619
python flow_past_cylinder.py --Re 620
python flow_past_cylinder.py --Re 621
python flow_past_cylinder.py --Re 622
python flow_past_cylinder.py --Re 623
python flow_past_cylinder.py --Re 624
python flow_past_cylinder.py --Re 625
python flow_past_cylinder.py --Re 626
python flow_past_cylinder.py --Re 627
