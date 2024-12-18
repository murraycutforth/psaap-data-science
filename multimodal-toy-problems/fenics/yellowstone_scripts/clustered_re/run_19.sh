#!/bin/bash
#SBATCH -J fenicsx_19
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 740.1183706410426
python flow_past_cylinder.py --Re 1573.5188541205919
python flow_past_cylinder.py --Re 1420.570500751466
python flow_past_cylinder.py --Re 696.0547925852242
python flow_past_cylinder.py --Re 253.43149825906193
python flow_past_cylinder.py --Re 277.1010498920694
python flow_past_cylinder.py --Re 275.11006077509813
python flow_past_cylinder.py --Re 1446.4358444371871
python flow_past_cylinder.py --Re 209.99755217586733
python flow_past_cylinder.py --Re 1511.1089141440293
python flow_past_cylinder.py --Re 1376.3447227198144
python flow_past_cylinder.py --Re 1507.923027343252
python flow_past_cylinder.py --Re 641.9348419266747
python flow_past_cylinder.py --Re 793.5647499504556
python flow_past_cylinder.py --Re 1587.8936838461548
python flow_past_cylinder.py --Re 786.6892211230617
python flow_past_cylinder.py --Re 715.4583673350875
python flow_past_cylinder.py --Re 1464.7437510827408
python flow_past_cylinder.py --Re 202.71310955682705
python flow_past_cylinder.py --Re 1599.5572420917713
python flow_past_cylinder.py --Re 791.5640513227147
python flow_past_cylinder.py --Re 1556.86784457375
python flow_past_cylinder.py --Re 1468.547444777583
python flow_past_cylinder.py --Re 766.2227464460767
python flow_past_cylinder.py --Re 195.08724464964797
python flow_past_cylinder.py --Re 1501.464217393874
python flow_past_cylinder.py --Re 715.0880777115518
python flow_past_cylinder.py --Re 689.2655697106004
python flow_past_cylinder.py --Re 149.79754116468834
python flow_past_cylinder.py --Re 278.5731285717502
python flow_past_cylinder.py --Re 248.94208921810892
python flow_past_cylinder.py --Re 228.62811896896224
python flow_past_cylinder.py --Re 788.9647612529069
python flow_past_cylinder.py --Re 229.8078007919629
python flow_past_cylinder.py --Re 269.5246073467947
python flow_past_cylinder.py --Re 269.8591790269489
python flow_past_cylinder.py --Re 745.0384336951424
python flow_past_cylinder.py --Re 816.7107900447654
python flow_past_cylinder.py --Re 1479.1284075403573
python flow_past_cylinder.py --Re 1503.7578900779843
python flow_past_cylinder.py --Re 268.4433906706736
python flow_past_cylinder.py --Re 765.9516352306546
python flow_past_cylinder.py --Re 1502.7252546379896
python flow_past_cylinder.py --Re 1487.8250433586934
python flow_past_cylinder.py --Re 748.1108750900789
python flow_past_cylinder.py --Re 1532.2889442937123
python flow_past_cylinder.py --Re 1506.8115652566244
python flow_past_cylinder.py --Re 753.1683941863073
