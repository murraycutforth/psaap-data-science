#!/bin/bash
#SBATCH -J fenicsx_15
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 626.3609839149058
python flow_past_cylinder.py --Re 207.25547727506992
python flow_past_cylinder.py --Re 209.71369820738497
python flow_past_cylinder.py --Re 1424.0273565740308
python flow_past_cylinder.py --Re 266.73131017775665
python flow_past_cylinder.py --Re 251.27245535731524
python flow_past_cylinder.py --Re 1581.9994012526627
python flow_past_cylinder.py --Re 248.37456317916596
python flow_past_cylinder.py --Re 281.5396487232677
python flow_past_cylinder.py --Re 206.66027874434502
python flow_past_cylinder.py --Re 1515.0776747655414
python flow_past_cylinder.py --Re 285.7525233028864
python flow_past_cylinder.py --Re 670.7100731672898
python flow_past_cylinder.py --Re 831.9588193312607
python flow_past_cylinder.py --Re 282.2722525163645
python flow_past_cylinder.py --Re 744.8134781436461
python flow_past_cylinder.py --Re 1581.7667696638705
python flow_past_cylinder.py --Re 666.9246653029077
python flow_past_cylinder.py --Re 1463.3006886131686
python flow_past_cylinder.py --Re 1472.8194858135862
python flow_past_cylinder.py --Re 244.35393025665783
python flow_past_cylinder.py --Re 765.735698675998
python flow_past_cylinder.py --Re 817.7063927465119
python flow_past_cylinder.py --Re 1498.1856341850075
python flow_past_cylinder.py --Re 759.0454137974816
python flow_past_cylinder.py --Re 323.7344636268335
python flow_past_cylinder.py --Re 253.59021026235388
python flow_past_cylinder.py --Re 771.3693639176741
python flow_past_cylinder.py --Re 733.7314025723109
python flow_past_cylinder.py --Re 1473.1819263080206
python flow_past_cylinder.py --Re 744.5957482899357
python flow_past_cylinder.py --Re 740.6914810877786
python flow_past_cylinder.py --Re 329.7530751802825
python flow_past_cylinder.py --Re 1459.1444452397106
python flow_past_cylinder.py --Re 171.81080211941335
python flow_past_cylinder.py --Re 288.04448573550695
python flow_past_cylinder.py --Re 693.5255206661885
python flow_past_cylinder.py --Re 1545.1521083734024
python flow_past_cylinder.py --Re 623.2627189906905
python flow_past_cylinder.py --Re 1498.167289420505
python flow_past_cylinder.py --Re 202.47976781778863
python flow_past_cylinder.py --Re 785.781571156556
python flow_past_cylinder.py --Re 253.59170174501125
python flow_past_cylinder.py --Re 302.96288706972393
python flow_past_cylinder.py --Re 735.228636657009
python flow_past_cylinder.py --Re 1484.1670820692905
python flow_past_cylinder.py --Re 685.3007176594111
python flow_past_cylinder.py --Re 280.76480119909183
