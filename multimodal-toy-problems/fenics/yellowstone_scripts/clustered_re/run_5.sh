#!/bin/bash
#SBATCH -J fenicsx_5
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 778.7410275004503
python flow_past_cylinder.py --Re 675.5411900035422
python flow_past_cylinder.py --Re 1537.8487434365666
python flow_past_cylinder.py --Re 118.47897369428075
python flow_past_cylinder.py --Re 1521.30724949583
python flow_past_cylinder.py --Re 778.3709314062869
python flow_past_cylinder.py --Re 1491.5103470315112
python flow_past_cylinder.py --Re 259.38064159846726
python flow_past_cylinder.py --Re 1554.2440713387207
python flow_past_cylinder.py --Re 1520.4764813067704
python flow_past_cylinder.py --Re 159.49512866879653
python flow_past_cylinder.py --Re 1455.6551178265393
python flow_past_cylinder.py --Re 226.5614668831979
python flow_past_cylinder.py --Re 188.4583576286074
python flow_past_cylinder.py --Re 795.9622980135963
python flow_past_cylinder.py --Re 1497.337677829257
python flow_past_cylinder.py --Re 255.65534491293403
python flow_past_cylinder.py --Re 1498.231411271494
python flow_past_cylinder.py --Re 1553.292619778082
python flow_past_cylinder.py --Re 1579.4680542042506
python flow_past_cylinder.py --Re 713.6438844113243
python flow_past_cylinder.py --Re 288.84915102432507
python flow_past_cylinder.py --Re 775.1810278760647
python flow_past_cylinder.py --Re 687.8479685702905
python flow_past_cylinder.py --Re 146.7486734761671
python flow_past_cylinder.py --Re 259.8221551605821
python flow_past_cylinder.py --Re 719.9803124105399
python flow_past_cylinder.py --Re 165.18609713849793
python flow_past_cylinder.py --Re 789.5544454199432
python flow_past_cylinder.py --Re 749.212787391838
python flow_past_cylinder.py --Re 294.22830083433723
python flow_past_cylinder.py --Re 159.42853844249538
python flow_past_cylinder.py --Re 850.5448857355951
python flow_past_cylinder.py --Re 215.57109595055286
python flow_past_cylinder.py --Re 697.0832855745012
python flow_past_cylinder.py --Re 768.0441312348867
python flow_past_cylinder.py --Re 1651.25318029392
python flow_past_cylinder.py --Re 287.06089655907687
python flow_past_cylinder.py --Re 807.1525933818084
python flow_past_cylinder.py --Re 806.0016096777592
python flow_past_cylinder.py --Re 736.8699911494479
python flow_past_cylinder.py --Re 248.14740630347293
python flow_past_cylinder.py --Re 1580.1857483465442
python flow_past_cylinder.py --Re 1426.042068162174
python flow_past_cylinder.py --Re 1538.3313467231856
python flow_past_cylinder.py --Re 306.63995141145915
python flow_past_cylinder.py --Re 176.33520694366916
python flow_past_cylinder.py --Re 1395.103975689384
