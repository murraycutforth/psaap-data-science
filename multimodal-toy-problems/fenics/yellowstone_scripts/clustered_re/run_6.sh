#!/bin/bash
#SBATCH -J fenicsx_6
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 316.16767962652
python flow_past_cylinder.py --Re 1471.7574018710498
python flow_past_cylinder.py --Re 1544.484753273027
python flow_past_cylinder.py --Re 197.7473376273977
python flow_past_cylinder.py --Re 234.3460235889797
python flow_past_cylinder.py --Re 238.66770613601818
python flow_past_cylinder.py --Re 273.54281995379523
python flow_past_cylinder.py --Re 1523.2239684580518
python flow_past_cylinder.py --Re 1483.1367472567006
python flow_past_cylinder.py --Re 244.98274824777528
python flow_past_cylinder.py --Re 829.6967454779709
python flow_past_cylinder.py --Re 181.90779875247952
python flow_past_cylinder.py --Re 1490.7825268773497
python flow_past_cylinder.py --Re 1449.6102272080843
python flow_past_cylinder.py --Re 378.28972736767116
python flow_past_cylinder.py --Re 1493.4935953196107
python flow_past_cylinder.py --Re 244.5357828960711
python flow_past_cylinder.py --Re 852.1859105617847
python flow_past_cylinder.py --Re 1498.2730541834203
python flow_past_cylinder.py --Re 730.11284242641
python flow_past_cylinder.py --Re 318.4217595320838
python flow_past_cylinder.py --Re 719.1220630330689
python flow_past_cylinder.py --Re 216.44791701255184
python flow_past_cylinder.py --Re 267.1863208188081
python flow_past_cylinder.py --Re 245.18811426553168
python flow_past_cylinder.py --Re 721.6630465742447
python flow_past_cylinder.py --Re 194.64125817361293
python flow_past_cylinder.py --Re 323.79266972808216
python flow_past_cylinder.py --Re 755.6411995983261
python flow_past_cylinder.py --Re 1490.0224208736215
python flow_past_cylinder.py --Re 743.5056787230748
python flow_past_cylinder.py --Re 282.2878608008202
python flow_past_cylinder.py --Re 1471.04878267867
python flow_past_cylinder.py --Re 762.8521601300343
python flow_past_cylinder.py --Re 1494.2162008045773
python flow_past_cylinder.py --Re 755.4053332738301
python flow_past_cylinder.py --Re 249.63933257941076
python flow_past_cylinder.py --Re 782.1484323469198
python flow_past_cylinder.py --Re 267.7521245099394
python flow_past_cylinder.py --Re 213.46022529695577
python flow_past_cylinder.py --Re 1582.838582450014
python flow_past_cylinder.py --Re 270.6752871837597
python flow_past_cylinder.py --Re 746.3298953864636
python flow_past_cylinder.py --Re 181.48681861494111
python flow_past_cylinder.py --Re 777.9800813438076
python flow_past_cylinder.py --Re 219.77023007802487
python flow_past_cylinder.py --Re 280.52292797574233
python flow_past_cylinder.py --Re 228.0636388712228
