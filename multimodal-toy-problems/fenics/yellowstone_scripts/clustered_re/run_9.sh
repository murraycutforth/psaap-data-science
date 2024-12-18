#!/bin/bash
#SBATCH -J fenicsx_9
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1413.378960193418
python flow_past_cylinder.py --Re 316.75208755111765
python flow_past_cylinder.py --Re 691.1802405487556
python flow_past_cylinder.py --Re 763.5086267307905
python flow_past_cylinder.py --Re 750.5787435895596
python flow_past_cylinder.py --Re 1560.5496650248567
python flow_past_cylinder.py --Re 1470.5104011560566
python flow_past_cylinder.py --Re 250.12446719436664
python flow_past_cylinder.py --Re 1540.5078520470809
python flow_past_cylinder.py --Re 1491.0973015787292
python flow_past_cylinder.py --Re 1529.5191832422497
python flow_past_cylinder.py --Re 817.2456016770377
python flow_past_cylinder.py --Re 1436.4668126340364
python flow_past_cylinder.py --Re 1474.1569834578684
python flow_past_cylinder.py --Re 708.6949267545399
python flow_past_cylinder.py --Re 726.2037287743879
python flow_past_cylinder.py --Re 1519.6324221321693
python flow_past_cylinder.py --Re 320.21965946396386
python flow_past_cylinder.py --Re 263.67971043346716
python flow_past_cylinder.py --Re 227.59737256844826
python flow_past_cylinder.py --Re 1549.3091042097146
python flow_past_cylinder.py --Re 1520.896335384567
python flow_past_cylinder.py --Re 1428.499141149119
python flow_past_cylinder.py --Re 286.411809581473
python flow_past_cylinder.py --Re 1489.6179420561782
python flow_past_cylinder.py --Re 719.3034506372791
python flow_past_cylinder.py --Re 285.68826244545323
python flow_past_cylinder.py --Re 256.7430450604113
python flow_past_cylinder.py --Re 1485.4798862715354
python flow_past_cylinder.py --Re 249.4538205115713
python flow_past_cylinder.py --Re 747.7183854767055
python flow_past_cylinder.py --Re 212.2570861744851
python flow_past_cylinder.py --Re 1559.579404937491
python flow_past_cylinder.py --Re 780.7655874374424
python flow_past_cylinder.py --Re 239.34427467142802
python flow_past_cylinder.py --Re 702.4143340629195
python flow_past_cylinder.py --Re 1539.1520351956538
python flow_past_cylinder.py --Re 1579.7525014035189
python flow_past_cylinder.py --Re 709.9122504167389
python flow_past_cylinder.py --Re 1548.4452940818644
python flow_past_cylinder.py --Re 700.0202947661289
python flow_past_cylinder.py --Re 729.7302832936548
python flow_past_cylinder.py --Re 154.96894402948854
python flow_past_cylinder.py --Re 1591.9544908364057
python flow_past_cylinder.py --Re 202.31364527752856
python flow_past_cylinder.py --Re 699.9009148674751
python flow_past_cylinder.py --Re 1412.7254736731927
python flow_past_cylinder.py --Re 261.2242675464014
