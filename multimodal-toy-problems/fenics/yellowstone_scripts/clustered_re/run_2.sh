#!/bin/bash
#SBATCH -J fenicsx_2
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1486.7419395931724
python flow_past_cylinder.py --Re 279.34102418260755
python flow_past_cylinder.py --Re 1599.0230278173262
python flow_past_cylinder.py --Re 752.4779401374925
python flow_past_cylinder.py --Re 1479.3076834774702
python flow_past_cylinder.py --Re 1395.588666596995
python flow_past_cylinder.py --Re 1433.3345369867816
python flow_past_cylinder.py --Re 1484.2022361512409
python flow_past_cylinder.py --Re 1490.7157671865968
python flow_past_cylinder.py --Re 802.7862702655922
python flow_past_cylinder.py --Re 1466.2133242948112
python flow_past_cylinder.py --Re 222.51232692275136
python flow_past_cylinder.py --Re 1510.8765571816796
python flow_past_cylinder.py --Re 673.7162657596215
python flow_past_cylinder.py --Re 329.0442839451044
python flow_past_cylinder.py --Re 1383.6684555548761
python flow_past_cylinder.py --Re 1379.3083747472863
python flow_past_cylinder.py --Re 676.6260509789652
python flow_past_cylinder.py --Re 693.2044031906346
python flow_past_cylinder.py --Re 265.08220104573724
python flow_past_cylinder.py --Re 264.27824916676263
python flow_past_cylinder.py --Re 859.6512522532475
python flow_past_cylinder.py --Re 1561.109924155285
python flow_past_cylinder.py --Re 1484.4601708248947
python flow_past_cylinder.py --Re 1505.2999094642641
python flow_past_cylinder.py --Re 743.1993974735411
python flow_past_cylinder.py --Re 1490.247171093901
python flow_past_cylinder.py --Re 687.8227656101783
python flow_past_cylinder.py --Re 639.8223260723025
python flow_past_cylinder.py --Re 1567.632769411772
python flow_past_cylinder.py --Re 247.98163009045163
python flow_past_cylinder.py --Re 1490.4936091209613
python flow_past_cylinder.py --Re 265.32538821049224
python flow_past_cylinder.py --Re 238.2007887704673
python flow_past_cylinder.py --Re 213.13494347416582
python flow_past_cylinder.py --Re 211.28822420014208
python flow_past_cylinder.py --Re 303.93964105779196
python flow_past_cylinder.py --Re 224.8867321483653
python flow_past_cylinder.py --Re 813.5448875660749
python flow_past_cylinder.py --Re 171.93724746133373
python flow_past_cylinder.py --Re 160.3721570545171
python flow_past_cylinder.py --Re 1456.8244531766668
python flow_past_cylinder.py --Re 1466.586295570861
python flow_past_cylinder.py --Re 831.017440188032
python flow_past_cylinder.py --Re 240.74073213091705
python flow_past_cylinder.py --Re 803.8059127061695
python flow_past_cylinder.py --Re 1367.5196830098923
python flow_past_cylinder.py --Re 296.9005282669647
