#!/bin/bash
#SBATCH -J fenicsx_20
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 825.1414017808366
python flow_past_cylinder.py --Re 1461.714153347973
python flow_past_cylinder.py --Re 373.51192455855517
python flow_past_cylinder.py --Re 1562.586197620926
python flow_past_cylinder.py --Re 1417.5271189969071
python flow_past_cylinder.py --Re 667.2879017163086
python flow_past_cylinder.py --Re 1510.0632547283149
python flow_past_cylinder.py --Re 264.0766307038289
python flow_past_cylinder.py --Re 224.8426243692402
python flow_past_cylinder.py --Re 735.4956166953764
python flow_past_cylinder.py --Re 1582.2052128012947
python flow_past_cylinder.py --Re 735.9150095114637
python flow_past_cylinder.py --Re 146.3862234355988
python flow_past_cylinder.py --Re 1415.8349709116815
python flow_past_cylinder.py --Re 214.38508646676064
python flow_past_cylinder.py --Re 680.0494179806068
python flow_past_cylinder.py --Re 800.0919366031301
python flow_past_cylinder.py --Re 318.73300104224523
python flow_past_cylinder.py --Re 640.5252361071128
python flow_past_cylinder.py --Re 776.092401923907
python flow_past_cylinder.py --Re 1560.3858049157038
python flow_past_cylinder.py --Re 1492.1874609468882
python flow_past_cylinder.py --Re 609.7989916042129
python flow_past_cylinder.py --Re 213.09202303382858
python flow_past_cylinder.py --Re 713.3788117001261
python flow_past_cylinder.py --Re 769.6393954255117
python flow_past_cylinder.py --Re 1525.2394853396256
python flow_past_cylinder.py --Re 1352.3570952809562
python flow_past_cylinder.py --Re 329.7252140747825
python flow_past_cylinder.py --Re 1511.202716638962
python flow_past_cylinder.py --Re 761.1979445180002
python flow_past_cylinder.py --Re 1544.654705472405
python flow_past_cylinder.py --Re 665.4113604448435
python flow_past_cylinder.py --Re 1510.1211822464209
python flow_past_cylinder.py --Re 810.1160529198897
python flow_past_cylinder.py --Re 715.0124852709256
python flow_past_cylinder.py --Re 798.0122208628826
python flow_past_cylinder.py --Re 213.22003040585048
python flow_past_cylinder.py --Re 302.7682968441693
python flow_past_cylinder.py --Re 1526.8528155728297
