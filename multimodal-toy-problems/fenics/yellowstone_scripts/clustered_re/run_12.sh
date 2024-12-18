#!/bin/bash
#SBATCH -J fenicsx_12
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 737.0683784271828
python flow_past_cylinder.py --Re 1491.5092513245618
python flow_past_cylinder.py --Re 237.98420714069988
python flow_past_cylinder.py --Re 689.3937636368015
python flow_past_cylinder.py --Re 1596.1474737415415
python flow_past_cylinder.py --Re 655.5568234923792
python flow_past_cylinder.py --Re 755.8094565711704
python flow_past_cylinder.py --Re 1561.6580992577922
python flow_past_cylinder.py --Re 293.92115805314904
python flow_past_cylinder.py --Re 764.8764059332864
python flow_past_cylinder.py --Re 316.9004638964234
python flow_past_cylinder.py --Re 814.1583284630036
python flow_past_cylinder.py --Re 283.0642253367969
python flow_past_cylinder.py --Re 1452.247762135748
python flow_past_cylinder.py --Re 1479.0032793082796
python flow_past_cylinder.py --Re 1426.6811802006903
python flow_past_cylinder.py --Re 782.0905280877321
python flow_past_cylinder.py --Re 180.53941158138045
python flow_past_cylinder.py --Re 229.60263573901162
python flow_past_cylinder.py --Re 771.3086026615617
python flow_past_cylinder.py --Re 818.9506206041779
python flow_past_cylinder.py --Re 1462.7789260096888
python flow_past_cylinder.py --Re 730.0706020779784
python flow_past_cylinder.py --Re 709.9205143211163
python flow_past_cylinder.py --Re 1543.073677533731
python flow_past_cylinder.py --Re 698.8108957014509
python flow_past_cylinder.py --Re 224.1957472908726
python flow_past_cylinder.py --Re 1409.3851353058142
python flow_past_cylinder.py --Re 750.7282651782879
python flow_past_cylinder.py --Re 1449.7482642174866
python flow_past_cylinder.py --Re 285.7436506427284
python flow_past_cylinder.py --Re 1509.381095142044
python flow_past_cylinder.py --Re 185.56067284501975
python flow_past_cylinder.py --Re 330.50237305663944
python flow_past_cylinder.py --Re 260.7749417309905
python flow_past_cylinder.py --Re 674.6675315417675
python flow_past_cylinder.py --Re 180.03794564085513
python flow_past_cylinder.py --Re 1477.2369675578507
python flow_past_cylinder.py --Re 698.9088627707318
python flow_past_cylinder.py --Re 257.2023853128346
python flow_past_cylinder.py --Re 279.068571037474
python flow_past_cylinder.py --Re 1461.2713190556258
python flow_past_cylinder.py --Re 1595.4814754120807
python flow_past_cylinder.py --Re 776.5567883572611
python flow_past_cylinder.py --Re 1531.8628008423902
python flow_past_cylinder.py --Re 770.1684620546608
python flow_past_cylinder.py --Re 802.2022397121349
python flow_past_cylinder.py --Re 1579.7441040012009
