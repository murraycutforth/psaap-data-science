#!/bin/bash
#SBATCH -J fenicsx_3
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1513.4173102703846
python flow_past_cylinder.py --Re 1525.5578449337295
python flow_past_cylinder.py --Re 1450.9056044171416
python flow_past_cylinder.py --Re 1449.286400502891
python flow_past_cylinder.py --Re 195.8874639606795
python flow_past_cylinder.py --Re 735.6222672845088
python flow_past_cylinder.py --Re 280.5897631282107
python flow_past_cylinder.py --Re 307.2344607952558
python flow_past_cylinder.py --Re 1414.495179894883
python flow_past_cylinder.py --Re 253.01324730454368
python flow_past_cylinder.py --Re 783.5910946547659
python flow_past_cylinder.py --Re 1545.648645958907
python flow_past_cylinder.py --Re 1567.0992310414476
python flow_past_cylinder.py --Re 1508.4622704958463
python flow_past_cylinder.py --Re 1504.827361033033
python flow_past_cylinder.py --Re 251.01709848960465
python flow_past_cylinder.py --Re 706.9662890037963
python flow_past_cylinder.py --Re 250.03450662594855
python flow_past_cylinder.py --Re 718.0300517793531
python flow_past_cylinder.py --Re 313.67270448955054
python flow_past_cylinder.py --Re 210.02920588527923
python flow_past_cylinder.py --Re 1561.1311029775823
python flow_past_cylinder.py --Re 266.3089481513315
python flow_past_cylinder.py --Re 711.5771154587466
python flow_past_cylinder.py --Re 1551.880680800297
python flow_past_cylinder.py --Re 276.8544316835645
python flow_past_cylinder.py --Re 801.7407953382342
python flow_past_cylinder.py --Re 844.7195227453449
python flow_past_cylinder.py --Re 721.2141663077169
python flow_past_cylinder.py --Re 1404.0892822151286
python flow_past_cylinder.py --Re 1434.6576183178915
python flow_past_cylinder.py --Re 1570.5140618500268
python flow_past_cylinder.py --Re 163.27867978650963
python flow_past_cylinder.py --Re 253.73243556730154
python flow_past_cylinder.py --Re 244.65968038941583
python flow_past_cylinder.py --Re 790.4407511427335
python flow_past_cylinder.py --Re 763.2469252938525
python flow_past_cylinder.py --Re 243.63279566087414
python flow_past_cylinder.py --Re 225.19277676125085
python flow_past_cylinder.py --Re 1489.6130106165176
python flow_past_cylinder.py --Re 752.9183598784772
python flow_past_cylinder.py --Re 179.2225413221732
python flow_past_cylinder.py --Re 1470.2704977694157
python flow_past_cylinder.py --Re 296.44474426786434
python flow_past_cylinder.py --Re 282.70080741253344
python flow_past_cylinder.py --Re 783.1060726361237
python flow_past_cylinder.py --Re 1508.9643555372165
python flow_past_cylinder.py --Re 1467.7224912954741
