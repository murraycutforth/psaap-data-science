#!/bin/bash
#SBATCH -J fenicsx_0
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 799.6720276623353
python flow_past_cylinder.py --Re 189.3109464857593
python flow_past_cylinder.py --Re 1536.341261491783
python flow_past_cylinder.py --Re 1517.5450162140617
python flow_past_cylinder.py --Re 1493.9040050400522
python flow_past_cylinder.py --Re 272.21658782083836
python flow_past_cylinder.py --Re 1505.533282972416
python flow_past_cylinder.py --Re 779.8789258145886
python flow_past_cylinder.py --Re 249.68811833031722
python flow_past_cylinder.py --Re 245.68290574610432
python flow_past_cylinder.py --Re 281.7323374677722
python flow_past_cylinder.py --Re 145.51964071806503
python flow_past_cylinder.py --Re 282.3090039747517
python flow_past_cylinder.py --Re 769.8946069815262
python flow_past_cylinder.py --Re 369.0665174495932
python flow_past_cylinder.py --Re 1530.339199885276
python flow_past_cylinder.py --Re 673.5883673349712
python flow_past_cylinder.py --Re 250.81072182182479
python flow_past_cylinder.py --Re 831.4074765577079
python flow_past_cylinder.py --Re 317.8335918011303
python flow_past_cylinder.py --Re 1426.9626344938374
python flow_past_cylinder.py --Re 1447.3264048639887
python flow_past_cylinder.py --Re 378.8689598771954
python flow_past_cylinder.py --Re 707.1047318041832
python flow_past_cylinder.py --Re 1529.5666378332578
python flow_past_cylinder.py --Re 1548.8740482502974
python flow_past_cylinder.py --Re 796.3680269912121
python flow_past_cylinder.py --Re 223.53967663638016
python flow_past_cylinder.py --Re 273.6712940903793
python flow_past_cylinder.py --Re 686.0620206804632
python flow_past_cylinder.py --Re 1452.318416431988
python flow_past_cylinder.py --Re 722.1603540773169
python flow_past_cylinder.py --Re 209.50528888885086
python flow_past_cylinder.py --Re 686.2818134745994
python flow_past_cylinder.py --Re 1529.8671258446905
python flow_past_cylinder.py --Re 768.2857768257636
python flow_past_cylinder.py --Re 765.3284337630703
python flow_past_cylinder.py --Re 275.81625948570223
python flow_past_cylinder.py --Re 1513.1632436047487
python flow_past_cylinder.py --Re 784.8978827510597
python flow_past_cylinder.py --Re 1496.4343881965597
python flow_past_cylinder.py --Re 1394.7029539747525
python flow_past_cylinder.py --Re 300.91463713862856
python flow_past_cylinder.py --Re 1470.102971736338
python flow_past_cylinder.py --Re 201.21615644985891
python flow_past_cylinder.py --Re 1481.9068091709385
python flow_past_cylinder.py --Re 156.0875460261298
python flow_past_cylinder.py --Re 1458.701854738566
