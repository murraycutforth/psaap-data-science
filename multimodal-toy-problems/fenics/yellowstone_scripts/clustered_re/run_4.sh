#!/bin/bash
#SBATCH -J fenicsx_4
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1582.648372865173
python flow_past_cylinder.py --Re 800.0742883111755
python flow_past_cylinder.py --Re 786.2494017675858
python flow_past_cylinder.py --Re 1464.6690495908147
python flow_past_cylinder.py --Re 234.41245795648314
python flow_past_cylinder.py --Re 237.96368903861685
python flow_past_cylinder.py --Re 629.3053343883926
python flow_past_cylinder.py --Re 365.8047948181255
python flow_past_cylinder.py --Re 203.84173359985
python flow_past_cylinder.py --Re 140.66473611469553
python flow_past_cylinder.py --Re 766.1383875520146
python flow_past_cylinder.py --Re 727.100253500684
python flow_past_cylinder.py --Re 1484.4674431112423
python flow_past_cylinder.py --Re 706.3529943737916
python flow_past_cylinder.py --Re 1482.7001627064021
python flow_past_cylinder.py --Re 1482.5993153940615
python flow_past_cylinder.py --Re 223.22492071926573
python flow_past_cylinder.py --Re 1563.603908733831
python flow_past_cylinder.py --Re 380.65039975989333
python flow_past_cylinder.py --Re 1464.7794639774474
python flow_past_cylinder.py --Re 705.672308570943
python flow_past_cylinder.py --Re 856.152709821788
python flow_past_cylinder.py --Re 1451.5669100156704
python flow_past_cylinder.py --Re 1440.1839699675331
python flow_past_cylinder.py --Re 1405.8424894684167
python flow_past_cylinder.py --Re 295.99775890947564
python flow_past_cylinder.py --Re 1522.292510403014
python flow_past_cylinder.py --Re 241.02639439194235
python flow_past_cylinder.py --Re 735.8516791992402
python flow_past_cylinder.py --Re 705.9143847155708
python flow_past_cylinder.py --Re 1433.976232396347
python flow_past_cylinder.py --Re 796.2130200394495
python flow_past_cylinder.py --Re 705.8862548846593
python flow_past_cylinder.py --Re 684.4027170237755
python flow_past_cylinder.py --Re 791.105506237701
python flow_past_cylinder.py --Re 304.36277408850236
python flow_past_cylinder.py --Re 716.5357555026952
python flow_past_cylinder.py --Re 734.6507432254931
python flow_past_cylinder.py --Re 694.1454921486115
python flow_past_cylinder.py --Re 780.4419774901639
python flow_past_cylinder.py --Re 757.0428965361357
python flow_past_cylinder.py --Re 228.7334093141579
python flow_past_cylinder.py --Re 338.89333802131966
python flow_past_cylinder.py --Re 287.4209786765407
python flow_past_cylinder.py --Re 1589.172944964788
python flow_past_cylinder.py --Re 1358.4290952226722
python flow_past_cylinder.py --Re 636.3244658960509
python flow_past_cylinder.py --Re 1485.56138551434
