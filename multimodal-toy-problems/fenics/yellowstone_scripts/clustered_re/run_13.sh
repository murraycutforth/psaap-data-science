#!/bin/bash
#SBATCH -J fenicsx_13
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1410.6054302965124
python flow_past_cylinder.py --Re 1486.9245952807753
python flow_past_cylinder.py --Re 715.9162184205688
python flow_past_cylinder.py --Re 700.4873751504811
python flow_past_cylinder.py --Re 773.9060449466574
python flow_past_cylinder.py --Re 631.5020840907513
python flow_past_cylinder.py --Re 711.8063869665398
python flow_past_cylinder.py --Re 1493.3802434049446
python flow_past_cylinder.py --Re 1507.099501401576
python flow_past_cylinder.py --Re 259.68077992007744
python flow_past_cylinder.py --Re 784.8554306791161
python flow_past_cylinder.py --Re 1503.7714678771047
python flow_past_cylinder.py --Re 738.1780210718482
python flow_past_cylinder.py --Re 767.7382547360165
python flow_past_cylinder.py --Re 703.1204636645136
python flow_past_cylinder.py --Re 245.977236399
python flow_past_cylinder.py --Re 258.3640478718389
python flow_past_cylinder.py --Re 266.6134551518379
python flow_past_cylinder.py --Re 1441.9237279146005
python flow_past_cylinder.py --Re 326.98491613319777
python flow_past_cylinder.py --Re 1489.3909174271053
python flow_past_cylinder.py --Re 239.4452798629679
python flow_past_cylinder.py --Re 324.97936516878013
python flow_past_cylinder.py --Re 1506.6708355869755
python flow_past_cylinder.py --Re 1419.0073095232935
python flow_past_cylinder.py --Re 252.16563576482602
python flow_past_cylinder.py --Re 299.87454318376786
python flow_past_cylinder.py --Re 1446.519350854698
python flow_past_cylinder.py --Re 792.7261871894463
python flow_past_cylinder.py --Re 269.14492309643373
python flow_past_cylinder.py --Re 1410.8031746392255
python flow_past_cylinder.py --Re 221.11790379495258
python flow_past_cylinder.py --Re 170.8259340966631
python flow_past_cylinder.py --Re 195.75299959780023
python flow_past_cylinder.py --Re 225.1302297404066
python flow_past_cylinder.py --Re 745.7573856044098
python flow_past_cylinder.py --Re 230.74563515696573
python flow_past_cylinder.py --Re 714.8423751126556
python flow_past_cylinder.py --Re 371.6621288867343
python flow_past_cylinder.py --Re 1525.5800808586296
python flow_past_cylinder.py --Re 776.3096118935763
python flow_past_cylinder.py --Re 790.0655763504783
python flow_past_cylinder.py --Re 1518.293491727411
python flow_past_cylinder.py --Re 712.0930387835309
python flow_past_cylinder.py --Re 670.2875892655971
python flow_past_cylinder.py --Re 272.6494763264184
python flow_past_cylinder.py --Re 1470.989232498131
python flow_past_cylinder.py --Re 268.87265355256477
