#!/bin/bash
#SBATCH -J fenicsx_16
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1484.7970119754812
python flow_past_cylinder.py --Re 1534.57282635882
python flow_past_cylinder.py --Re 1528.3253784321496
python flow_past_cylinder.py --Re 1562.932222124042
python flow_past_cylinder.py --Re 1537.3228269588003
python flow_past_cylinder.py --Re 292.37126706870674
python flow_past_cylinder.py --Re 755.9519125251456
python flow_past_cylinder.py --Re 1485.2030357263877
python flow_past_cylinder.py --Re 1508.9502551070298
python flow_past_cylinder.py --Re 888.1232110292586
python flow_past_cylinder.py --Re 214.47890813432676
python flow_past_cylinder.py --Re 817.2208363600216
python flow_past_cylinder.py --Re 305.7849796974841
python flow_past_cylinder.py --Re 1480.1804336107637
python flow_past_cylinder.py --Re 735.4165833860924
python flow_past_cylinder.py --Re 756.9938384707903
python flow_past_cylinder.py --Re 276.68694980604334
python flow_past_cylinder.py --Re 757.7723890931599
python flow_past_cylinder.py --Re 256.36818727510683
python flow_past_cylinder.py --Re 720.7291021260847
python flow_past_cylinder.py --Re 225.9061394811009
python flow_past_cylinder.py --Re 229.62652670004755
python flow_past_cylinder.py --Re 745.0197594285958
python flow_past_cylinder.py --Re 693.6403952084244
python flow_past_cylinder.py --Re 240.9075910976868
python flow_past_cylinder.py --Re 1574.0192398048791
python flow_past_cylinder.py --Re 204.04709328492262
python flow_past_cylinder.py --Re 174.9902795647944
python flow_past_cylinder.py --Re 226.01711420521292
python flow_past_cylinder.py --Re 246.19218274837843
python flow_past_cylinder.py --Re 1500.4027756678788
python flow_past_cylinder.py --Re 210.2541195971937
python flow_past_cylinder.py --Re 1567.5221154510643
python flow_past_cylinder.py --Re 716.5291523542026
python flow_past_cylinder.py --Re 271.0784032489994
python flow_past_cylinder.py --Re 1520.9819884296496
python flow_past_cylinder.py --Re 804.8969747085888
python flow_past_cylinder.py --Re 723.6161870252015
python flow_past_cylinder.py --Re 190.19209960328152
python flow_past_cylinder.py --Re 708.9776754924092
python flow_past_cylinder.py --Re 214.22740782677874
python flow_past_cylinder.py --Re 267.8640108246169
python flow_past_cylinder.py --Re 264.9340530956749
python flow_past_cylinder.py --Re 1551.5913677709868
python flow_past_cylinder.py --Re 797.924425015829
python flow_past_cylinder.py --Re 720.6371422754213
python flow_past_cylinder.py --Re 196.58420168646762
python flow_past_cylinder.py --Re 232.83600534894492
