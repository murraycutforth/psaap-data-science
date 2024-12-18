#!/bin/bash
#SBATCH -J fenicsx_11
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1441.6583466022416
python flow_past_cylinder.py --Re 754.337936887313
python flow_past_cylinder.py --Re 1487.8950370587368
python flow_past_cylinder.py --Re 1487.9229723159608
python flow_past_cylinder.py --Re 710.7776498085042
python flow_past_cylinder.py --Re 277.3634948855424
python flow_past_cylinder.py --Re 784.9126960941887
python flow_past_cylinder.py --Re 1490.8687498619759
python flow_past_cylinder.py --Re 781.8551726377672
python flow_past_cylinder.py --Re 284.2791523593007
python flow_past_cylinder.py --Re 1465.6753518694218
python flow_past_cylinder.py --Re 735.6384443452845
python flow_past_cylinder.py --Re 1496.8524195100447
python flow_past_cylinder.py --Re 1529.375052458614
python flow_past_cylinder.py --Re 736.4842059130297
python flow_past_cylinder.py --Re 231.82487013784774
python flow_past_cylinder.py --Re 1580.402909412038
python flow_past_cylinder.py --Re 1432.1613565603727
python flow_past_cylinder.py --Re 1448.675551293906
python flow_past_cylinder.py --Re 1550.1741178059174
python flow_past_cylinder.py --Re 1500.627616698322
python flow_past_cylinder.py --Re 1555.4242625187032
python flow_past_cylinder.py --Re 1462.239502587858
python flow_past_cylinder.py --Re 211.96160584718697
python flow_past_cylinder.py --Re 819.7900938362944
python flow_past_cylinder.py --Re 1445.6165592356933
python flow_past_cylinder.py --Re 160.97661647643108
python flow_past_cylinder.py --Re 1483.9836015116123
python flow_past_cylinder.py --Re 272.3370716723033
python flow_past_cylinder.py --Re 715.0841222044487
python flow_past_cylinder.py --Re 278.6367153428214
python flow_past_cylinder.py --Re 271.0145783396108
python flow_past_cylinder.py --Re 1499.7381261855583
python flow_past_cylinder.py --Re 273.3524494731379
python flow_past_cylinder.py --Re 847.0047000772978
python flow_past_cylinder.py --Re 732.7413868016391
python flow_past_cylinder.py --Re 1467.152725789135
python flow_past_cylinder.py --Re 750.5652311265965
python flow_past_cylinder.py --Re 1549.5674781052967
python flow_past_cylinder.py --Re 223.51552959296274
python flow_past_cylinder.py --Re 282.01122589124134
python flow_past_cylinder.py --Re 656.00298874197
python flow_past_cylinder.py --Re 836.4727117274192
python flow_past_cylinder.py --Re 177.97253016488227
python flow_past_cylinder.py --Re 658.9935498475184
python flow_past_cylinder.py --Re 1521.5323373317665
python flow_past_cylinder.py --Re 203.58278756663802
python flow_past_cylinder.py --Re 336.1691027323309
