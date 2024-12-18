#!/bin/bash
#SBATCH -J fenicsx_18
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1486.5169735326406
python flow_past_cylinder.py --Re 212.8796823719569
python flow_past_cylinder.py --Re 767.6797241089055
python flow_past_cylinder.py --Re 777.196233134376
python flow_past_cylinder.py --Re 230.32731716313748
python flow_past_cylinder.py --Re 745.3797203069654
python flow_past_cylinder.py --Re 714.9084619421077
python flow_past_cylinder.py --Re 802.6900117244838
python flow_past_cylinder.py --Re 746.5424368816962
python flow_past_cylinder.py --Re 761.703645129563
python flow_past_cylinder.py --Re 341.5913181105981
python flow_past_cylinder.py --Re 304.668809640379
python flow_past_cylinder.py --Re 276.7246372037564
python flow_past_cylinder.py --Re 737.993528660026
python flow_past_cylinder.py --Re 829.1753963574558
python flow_past_cylinder.py --Re 802.2790961670262
python flow_past_cylinder.py --Re 210.53760886977688
python flow_past_cylinder.py --Re 1563.1687228008311
python flow_past_cylinder.py --Re 1533.1494864837146
python flow_past_cylinder.py --Re 188.8238978047878
python flow_past_cylinder.py --Re 195.94310837831944
python flow_past_cylinder.py --Re 1537.8013436303677
python flow_past_cylinder.py --Re 1483.7668470860503
python flow_past_cylinder.py --Re 286.05968366543567
python flow_past_cylinder.py --Re 311.0541408926054
python flow_past_cylinder.py --Re 716.757208602216
python flow_past_cylinder.py --Re 294.71848792424595
python flow_past_cylinder.py --Re 234.18760451341893
python flow_past_cylinder.py --Re 308.4285503771987
python flow_past_cylinder.py --Re 1496.813738673935
python flow_past_cylinder.py --Re 724.4442090384065
python flow_past_cylinder.py --Re 745.8474195178621
python flow_past_cylinder.py --Re 291.16425640569713
python flow_past_cylinder.py --Re 1565.5450433025844
python flow_past_cylinder.py --Re 248.31720350847726
python flow_past_cylinder.py --Re 161.51207271712204
python flow_past_cylinder.py --Re 1438.3064377743667
python flow_past_cylinder.py --Re 249.80617577208676
python flow_past_cylinder.py --Re 219.17088780132312
python flow_past_cylinder.py --Re 286.7147885802633
python flow_past_cylinder.py --Re 239.39667623105322
python flow_past_cylinder.py --Re 202.85357133780855
python flow_past_cylinder.py --Re 1559.1583335621294
python flow_past_cylinder.py --Re 312.68325708752724
python flow_past_cylinder.py --Re 1450.8098689880394
python flow_past_cylinder.py --Re 773.4839786750873
python flow_past_cylinder.py --Re 1530.7835457350754
python flow_past_cylinder.py --Re 1484.5047388706728
