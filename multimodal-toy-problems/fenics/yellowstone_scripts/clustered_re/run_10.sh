#!/bin/bash
#SBATCH -J fenicsx_10
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 234.9843047202349
python flow_past_cylinder.py --Re 770.7344234905989
python flow_past_cylinder.py --Re 724.3225597179046
python flow_past_cylinder.py --Re 1559.5852616062043
python flow_past_cylinder.py --Re 1530.9243603312455
python flow_past_cylinder.py --Re 753.319836912957
python flow_past_cylinder.py --Re 292.01902016519483
python flow_past_cylinder.py --Re 697.4487403108529
python flow_past_cylinder.py --Re 720.8205827531027
python flow_past_cylinder.py --Re 258.7895777838452
python flow_past_cylinder.py --Re 726.9740668875514
python flow_past_cylinder.py --Re 1477.2578527381957
python flow_past_cylinder.py --Re 186.69425727183284
python flow_past_cylinder.py --Re 207.78253079682875
python flow_past_cylinder.py --Re 728.7637150613111
python flow_past_cylinder.py --Re 195.16260431540016
python flow_past_cylinder.py --Re 782.9511847560448
python flow_past_cylinder.py --Re 697.3585828943186
python flow_past_cylinder.py --Re 1555.1792074517994
python flow_past_cylinder.py --Re 321.6381887674317
python flow_past_cylinder.py --Re 259.9844867139793
python flow_past_cylinder.py --Re 843.1571567787697
python flow_past_cylinder.py --Re 1484.5724230068117
python flow_past_cylinder.py --Re 189.55592100416646
python flow_past_cylinder.py --Re 1455.6361523719322
python flow_past_cylinder.py --Re 858.1199325081394
python flow_past_cylinder.py --Re 827.4699367711935
python flow_past_cylinder.py --Re 1475.9517457077422
python flow_past_cylinder.py --Re 243.69979418412404
python flow_past_cylinder.py --Re 763.4495258621134
python flow_past_cylinder.py --Re 684.2110242368589
python flow_past_cylinder.py --Re 1510.3583180234443
python flow_past_cylinder.py --Re 332.98154143861154
python flow_past_cylinder.py --Re 699.5224216971318
python flow_past_cylinder.py --Re 715.6689497673946
python flow_past_cylinder.py --Re 211.60131955674868
python flow_past_cylinder.py --Re 1441.3269672589097
python flow_past_cylinder.py --Re 680.5163011837976
python flow_past_cylinder.py --Re 749.2196469521558
python flow_past_cylinder.py --Re 264.0235899153694
python flow_past_cylinder.py --Re 1562.7896460934699
python flow_past_cylinder.py --Re 327.92280540597267
python flow_past_cylinder.py --Re 1545.9013591043872
python flow_past_cylinder.py --Re 742.1066671443473
python flow_past_cylinder.py --Re 247.6871770177157
python flow_past_cylinder.py --Re 681.6012920829387
python flow_past_cylinder.py --Re 1468.171075417574
python flow_past_cylinder.py --Re 759.2632286846452
