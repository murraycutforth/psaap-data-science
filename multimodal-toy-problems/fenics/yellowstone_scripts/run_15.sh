#!/bin/bash
#sbatch -j fenicsx_15
#sbatch -n 1
#sbatch -t 48:00:00
#sbatch -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1540
mpirun -n 32 python flow_past_cylinder.py --Re 1541
mpirun -n 32 python flow_past_cylinder.py --Re 1542
mpirun -n 32 python flow_past_cylinder.py --Re 1543
mpirun -n 32 python flow_past_cylinder.py --Re 1544
mpirun -n 32 python flow_past_cylinder.py --Re 1545
mpirun -n 32 python flow_past_cylinder.py --Re 1546
mpirun -n 32 python flow_past_cylinder.py --Re 1547
mpirun -n 32 python flow_past_cylinder.py --Re 1548
mpirun -n 32 python flow_past_cylinder.py --Re 1549
mpirun -n 32 python flow_past_cylinder.py --Re 1550
mpirun -n 32 python flow_past_cylinder.py --Re 1551
mpirun -n 32 python flow_past_cylinder.py --Re 1552
mpirun -n 32 python flow_past_cylinder.py --Re 1553
mpirun -n 32 python flow_past_cylinder.py --Re 1554
mpirun -n 32 python flow_past_cylinder.py --Re 1555
mpirun -n 32 python flow_past_cylinder.py --Re 1556
mpirun -n 32 python flow_past_cylinder.py --Re 1557
mpirun -n 32 python flow_past_cylinder.py --Re 1558
mpirun -n 32 python flow_past_cylinder.py --Re 1559
mpirun -n 32 python flow_past_cylinder.py --Re 1560
mpirun -n 32 python flow_past_cylinder.py --Re 1561
mpirun -n 32 python flow_past_cylinder.py --Re 1562
mpirun -n 32 python flow_past_cylinder.py --Re 1563
mpirun -n 32 python flow_past_cylinder.py --Re 1564
mpirun -n 32 python flow_past_cylinder.py --Re 1565
mpirun -n 32 python flow_past_cylinder.py --Re 1566
mpirun -n 32 python flow_past_cylinder.py --Re 1567
mpirun -n 32 python flow_past_cylinder.py --Re 1568
mpirun -n 32 python flow_past_cylinder.py --Re 1569
mpirun -n 32 python flow_past_cylinder.py --Re 1570
mpirun -n 32 python flow_past_cylinder.py --Re 1571
mpirun -n 32 python flow_past_cylinder.py --Re 1572
mpirun -n 32 python flow_past_cylinder.py --Re 1573
mpirun -n 32 python flow_past_cylinder.py --Re 1574
mpirun -n 32 python flow_past_cylinder.py --Re 1575
mpirun -n 32 python flow_past_cylinder.py --Re 1576
mpirun -n 32 python flow_past_cylinder.py --Re 1577
mpirun -n 32 python flow_past_cylinder.py --Re 1578
mpirun -n 32 python flow_past_cylinder.py --Re 1579
mpirun -n 32 python flow_past_cylinder.py --Re 1580
mpirun -n 32 python flow_past_cylinder.py --Re 1581
mpirun -n 32 python flow_past_cylinder.py --Re 1582
mpirun -n 32 python flow_past_cylinder.py --Re 1583
mpirun -n 32 python flow_past_cylinder.py --Re 1584
mpirun -n 32 python flow_past_cylinder.py --Re 1585
mpirun -n 32 python flow_past_cylinder.py --Re 1586
mpirun -n 32 python flow_past_cylinder.py --Re 1587
mpirun -n 32 python flow_past_cylinder.py --Re 1588
mpirun -n 32 python flow_past_cylinder.py --Re 1589
mpirun -n 32 python flow_past_cylinder.py --Re 1590
mpirun -n 32 python flow_past_cylinder.py --Re 1591
mpirun -n 32 python flow_past_cylinder.py --Re 1592
mpirun -n 32 python flow_past_cylinder.py --Re 1593
mpirun -n 32 python flow_past_cylinder.py --Re 1594
mpirun -n 32 python flow_past_cylinder.py --Re 1595
mpirun -n 32 python flow_past_cylinder.py --Re 1596
mpirun -n 32 python flow_past_cylinder.py --Re 1597
mpirun -n 32 python flow_past_cylinder.py --Re 1598
mpirun -n 32 python flow_past_cylinder.py --Re 1599
mpirun -n 32 python flow_past_cylinder.py --Re 1600
mpirun -n 32 python flow_past_cylinder.py --Re 1601
mpirun -n 32 python flow_past_cylinder.py --Re 1602
mpirun -n 32 python flow_past_cylinder.py --Re 1603
mpirun -n 32 python flow_past_cylinder.py --Re 1604
mpirun -n 32 python flow_past_cylinder.py --Re 1605
mpirun -n 32 python flow_past_cylinder.py --Re 1606
mpirun -n 32 python flow_past_cylinder.py --Re 1607
mpirun -n 32 python flow_past_cylinder.py --Re 1608
mpirun -n 32 python flow_past_cylinder.py --Re 1609
mpirun -n 32 python flow_past_cylinder.py --Re 1610
mpirun -n 32 python flow_past_cylinder.py --Re 1611
mpirun -n 32 python flow_past_cylinder.py --Re 1612
mpirun -n 32 python flow_past_cylinder.py --Re 1613
mpirun -n 32 python flow_past_cylinder.py --Re 1614
mpirun -n 32 python flow_past_cylinder.py --Re 1615
mpirun -n 32 python flow_past_cylinder.py --Re 1616
mpirun -n 32 python flow_past_cylinder.py --Re 1617
mpirun -n 32 python flow_past_cylinder.py --Re 1618
mpirun -n 32 python flow_past_cylinder.py --Re 1619
mpirun -n 32 python flow_past_cylinder.py --Re 1620
mpirun -n 32 python flow_past_cylinder.py --Re 1621
mpirun -n 32 python flow_past_cylinder.py --Re 1622
mpirun -n 32 python flow_past_cylinder.py --Re 1623
mpirun -n 32 python flow_past_cylinder.py --Re 1624
mpirun -n 32 python flow_past_cylinder.py --Re 1625
mpirun -n 32 python flow_past_cylinder.py --Re 1626
mpirun -n 32 python flow_past_cylinder.py --Re 1627
mpirun -n 32 python flow_past_cylinder.py --Re 1628
mpirun -n 32 python flow_past_cylinder.py --Re 1629
mpirun -n 32 python flow_past_cylinder.py --Re 1630
mpirun -n 32 python flow_past_cylinder.py --Re 1631
mpirun -n 32 python flow_past_cylinder.py --Re 1632
mpirun -n 32 python flow_past_cylinder.py --Re 1633
mpirun -n 32 python flow_past_cylinder.py --Re 1634
mpirun -n 32 python flow_past_cylinder.py --Re 1635
