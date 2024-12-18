#!/bin/bash
#SBATCH -J fenicsx_14
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 300.75107678529855
python flow_past_cylinder.py --Re 183.75570807153954
python flow_past_cylinder.py --Re 1534.0479894739753
python flow_past_cylinder.py --Re 1517.0492023518166
python flow_past_cylinder.py --Re 1545.6574424501348
python flow_past_cylinder.py --Re 226.11400072772582
python flow_past_cylinder.py --Re 221.53520748543295
python flow_past_cylinder.py --Re 266.8579438643145
python flow_past_cylinder.py --Re 751.3056900222057
python flow_past_cylinder.py --Re 1530.6150521311406
python flow_past_cylinder.py --Re 791.0730043118558
python flow_past_cylinder.py --Re 263.22675523613304
python flow_past_cylinder.py --Re 337.2129617210288
python flow_past_cylinder.py --Re 699.8023569910847
python flow_past_cylinder.py --Re 1548.869335974807
python flow_past_cylinder.py --Re 282.35056980073233
python flow_past_cylinder.py --Re 1520.7773528350904
python flow_past_cylinder.py --Re 231.47849808909015
python flow_past_cylinder.py --Re 271.1877791232432
python flow_past_cylinder.py --Re 244.47378484792236
python flow_past_cylinder.py --Re 124.96323064991594
python flow_past_cylinder.py --Re 1440.6178264507478
python flow_past_cylinder.py --Re 801.7260541345846
python flow_past_cylinder.py --Re 1477.0973823800532
python flow_past_cylinder.py --Re 240.952218447751
python flow_past_cylinder.py --Re 792.2476534807806
python flow_past_cylinder.py --Re 713.179708499092
python flow_past_cylinder.py --Re 225.36736159280483
python flow_past_cylinder.py --Re 809.6196642336989
python flow_past_cylinder.py --Re 761.7818996572131
python flow_past_cylinder.py --Re 837.7777264634573
python flow_past_cylinder.py --Re 1473.6608753542964
python flow_past_cylinder.py --Re 1430.7342664304074
python flow_past_cylinder.py --Re 783.0442253382008
python flow_past_cylinder.py --Re 685.6157564415278
python flow_past_cylinder.py --Re 668.8871334434606
python flow_past_cylinder.py --Re 205.62158370882395
python flow_past_cylinder.py --Re 1517.071448732481
python flow_past_cylinder.py --Re 274.52410439260416
python flow_past_cylinder.py --Re 1444.03988053992
python flow_past_cylinder.py --Re 1474.4422480132941
python flow_past_cylinder.py --Re 220.70067841729062
python flow_past_cylinder.py --Re 1567.4610651619744
python flow_past_cylinder.py --Re 747.5065120696349
python flow_past_cylinder.py --Re 260.7568633651134
python flow_past_cylinder.py --Re 264.05905462418144
python flow_past_cylinder.py --Re 790.4114442213751
python flow_past_cylinder.py --Re 839.1621769369586
