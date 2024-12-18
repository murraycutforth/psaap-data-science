#!/bin/bash
#SBATCH -J fenicsx_8
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 770.8561531849698
python flow_past_cylinder.py --Re 1566.5380696018299
python flow_past_cylinder.py --Re 782.1475585423901
python flow_past_cylinder.py --Re 768.5559625112323
python flow_past_cylinder.py --Re 243.30638575720644
python flow_past_cylinder.py --Re 781.2147520628662
python flow_past_cylinder.py --Re 226.0771500836802
python flow_past_cylinder.py --Re 1507.2741212814474
python flow_past_cylinder.py --Re 1575.5344285997976
python flow_past_cylinder.py --Re 237.91029596222987
python flow_past_cylinder.py --Re 199.2350466568954
python flow_past_cylinder.py --Re 1534.7060225383686
python flow_past_cylinder.py --Re 1544.1058741413353
python flow_past_cylinder.py --Re 284.9835578153531
python flow_past_cylinder.py --Re 324.71960584539136
python flow_past_cylinder.py --Re 1460.4594915485131
python flow_past_cylinder.py --Re 722.085385417194
python flow_past_cylinder.py --Re 292.06204065179395
python flow_past_cylinder.py --Re 241.28945923097655
python flow_past_cylinder.py --Re 726.6942452514343
python flow_past_cylinder.py --Re 304.86968555339104
python flow_past_cylinder.py --Re 730.4871272042552
python flow_past_cylinder.py --Re 1370.5061278904227
python flow_past_cylinder.py --Re 179.25175636026677
python flow_past_cylinder.py --Re 342.554395168384
python flow_past_cylinder.py --Re 275.945549870084
python flow_past_cylinder.py --Re 271.8740605633709
python flow_past_cylinder.py --Re 248.9425166694524
python flow_past_cylinder.py --Re 252.49683914541274
python flow_past_cylinder.py --Re 852.2830015804661
python flow_past_cylinder.py --Re 265.2894581456516
python flow_past_cylinder.py --Re 821.7262418791274
python flow_past_cylinder.py --Re 351.7423815149691
python flow_past_cylinder.py --Re 1562.9139293933827
python flow_past_cylinder.py --Re 223.132420047041
python flow_past_cylinder.py --Re 260.5544984213193
python flow_past_cylinder.py --Re 1453.7218998302417
python flow_past_cylinder.py --Re 1425.8058523526397
python flow_past_cylinder.py --Re 1520.2837449679073
python flow_past_cylinder.py --Re 276.65839686993337
python flow_past_cylinder.py --Re 241.39911136633978
python flow_past_cylinder.py --Re 1521.151673544276
python flow_past_cylinder.py --Re 752.9234644183696
python flow_past_cylinder.py --Re 1544.5404181762674
python flow_past_cylinder.py --Re 710.2792442547424
python flow_past_cylinder.py --Re 744.28173862734
python flow_past_cylinder.py --Re 280.1219188972968
python flow_past_cylinder.py --Re 780.4590555557135
