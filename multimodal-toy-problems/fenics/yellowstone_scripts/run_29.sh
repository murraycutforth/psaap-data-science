#!/bin/bash
#SBATCH -J fenicsx_29
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1492
python flow_past_cylinder.py --Re 1493
python flow_past_cylinder.py --Re 1494
python flow_past_cylinder.py --Re 1495
python flow_past_cylinder.py --Re 1496
python flow_past_cylinder.py --Re 1497
python flow_past_cylinder.py --Re 1498
python flow_past_cylinder.py --Re 1499
python flow_past_cylinder.py --Re 1500
python flow_past_cylinder.py --Re 1501
python flow_past_cylinder.py --Re 1502
python flow_past_cylinder.py --Re 1503
python flow_past_cylinder.py --Re 1504
python flow_past_cylinder.py --Re 1505
python flow_past_cylinder.py --Re 1506
python flow_past_cylinder.py --Re 1507
python flow_past_cylinder.py --Re 1508
python flow_past_cylinder.py --Re 1509
python flow_past_cylinder.py --Re 1510
python flow_past_cylinder.py --Re 1511
python flow_past_cylinder.py --Re 1512
python flow_past_cylinder.py --Re 1513
python flow_past_cylinder.py --Re 1514
python flow_past_cylinder.py --Re 1515
python flow_past_cylinder.py --Re 1516
python flow_past_cylinder.py --Re 1517
python flow_past_cylinder.py --Re 1518
python flow_past_cylinder.py --Re 1519
python flow_past_cylinder.py --Re 1520
python flow_past_cylinder.py --Re 1521
python flow_past_cylinder.py --Re 1522
python flow_past_cylinder.py --Re 1523
python flow_past_cylinder.py --Re 1524
python flow_past_cylinder.py --Re 1525
python flow_past_cylinder.py --Re 1526
python flow_past_cylinder.py --Re 1527
python flow_past_cylinder.py --Re 1528
python flow_past_cylinder.py --Re 1529
python flow_past_cylinder.py --Re 1530
python flow_past_cylinder.py --Re 1531
python flow_past_cylinder.py --Re 1532
python flow_past_cylinder.py --Re 1533
python flow_past_cylinder.py --Re 1534
python flow_past_cylinder.py --Re 1535
python flow_past_cylinder.py --Re 1536
python flow_past_cylinder.py --Re 1537
python flow_past_cylinder.py --Re 1538
python flow_past_cylinder.py --Re 1539
