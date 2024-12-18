#!/bin/bash
#SBATCH -J fenicsx_17
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 222.5517389664702
python flow_past_cylinder.py --Re 274.8879004200143
python flow_past_cylinder.py --Re 1490.8950774692685
python flow_past_cylinder.py --Re 1554.082128890133
python flow_past_cylinder.py --Re 750.9149387057819
python flow_past_cylinder.py --Re 1587.3167061510644
python flow_past_cylinder.py --Re 248.39720413191054
python flow_past_cylinder.py --Re 1448.7977812835434
python flow_past_cylinder.py --Re 275.57584767010053
python flow_past_cylinder.py --Re 1489.4962069884918
python flow_past_cylinder.py --Re 1570.182100110028
python flow_past_cylinder.py --Re 769.7276944777299
python flow_past_cylinder.py --Re 257.1632024173308
python flow_past_cylinder.py --Re 213.66137227877348
python flow_past_cylinder.py --Re 1541.0142205336365
python flow_past_cylinder.py --Re 780.2548014847116
python flow_past_cylinder.py --Re 1425.7090220348784
python flow_past_cylinder.py --Re 1514.8696330682194
python flow_past_cylinder.py --Re 1481.024560613199
python flow_past_cylinder.py --Re 151.5764513710579
python flow_past_cylinder.py --Re 216.6920679836538
python flow_past_cylinder.py --Re 730.1709671937037
python flow_past_cylinder.py --Re 726.8144830986201
python flow_past_cylinder.py --Re 203.41545324984486
python flow_past_cylinder.py --Re 1465.2242332031906
python flow_past_cylinder.py --Re 265.8142070503234
python flow_past_cylinder.py --Re 701.0275557802812
python flow_past_cylinder.py --Re 748.4790867064094
python flow_past_cylinder.py --Re 277.2682797911737
python flow_past_cylinder.py --Re 274.80522129738796
python flow_past_cylinder.py --Re 1422.00755474726
python flow_past_cylinder.py --Re 732.1684744503841
python flow_past_cylinder.py --Re 1550.022570916204
python flow_past_cylinder.py --Re 1497.7013928504073
python flow_past_cylinder.py --Re 754.7374017929258
python flow_past_cylinder.py --Re 1423.6302506766785
python flow_past_cylinder.py --Re 302.940372807826
python flow_past_cylinder.py --Re 179.88625646748088
python flow_past_cylinder.py --Re 764.0412085615958
python flow_past_cylinder.py --Re 164.55723627952898
python flow_past_cylinder.py --Re 226.91688616063374
python flow_past_cylinder.py --Re 204.84071963166136
python flow_past_cylinder.py --Re 752.8151964525593
python flow_past_cylinder.py --Re 225.6813428189275
python flow_past_cylinder.py --Re 256.3147394343365
python flow_past_cylinder.py --Re 851.407239155889
python flow_past_cylinder.py --Re 750.9368377452566
python flow_past_cylinder.py --Re 274.8413201108939
