#!/bin/bash
#SBATCH -j fenicsx_32
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1636
mpirun -n 32 python flow_past_cylinder.py --Re 1637
mpirun -n 32 python flow_past_cylinder.py --Re 1638
mpirun -n 32 python flow_past_cylinder.py --Re 1639
mpirun -n 32 python flow_past_cylinder.py --Re 1640
mpirun -n 32 python flow_past_cylinder.py --Re 1641
mpirun -n 32 python flow_past_cylinder.py --Re 1642
mpirun -n 32 python flow_past_cylinder.py --Re 1643
mpirun -n 32 python flow_past_cylinder.py --Re 1644
mpirun -n 32 python flow_past_cylinder.py --Re 1645
mpirun -n 32 python flow_past_cylinder.py --Re 1646
mpirun -n 32 python flow_past_cylinder.py --Re 1647
mpirun -n 32 python flow_past_cylinder.py --Re 1648
mpirun -n 32 python flow_past_cylinder.py --Re 1649
mpirun -n 32 python flow_past_cylinder.py --Re 1650
mpirun -n 32 python flow_past_cylinder.py --Re 1651
mpirun -n 32 python flow_past_cylinder.py --Re 1652
mpirun -n 32 python flow_past_cylinder.py --Re 1653
mpirun -n 32 python flow_past_cylinder.py --Re 1654
mpirun -n 32 python flow_past_cylinder.py --Re 1655
mpirun -n 32 python flow_past_cylinder.py --Re 1656
mpirun -n 32 python flow_past_cylinder.py --Re 1657
mpirun -n 32 python flow_past_cylinder.py --Re 1658
mpirun -n 32 python flow_past_cylinder.py --Re 1659
mpirun -n 32 python flow_past_cylinder.py --Re 1660
mpirun -n 32 python flow_past_cylinder.py --Re 1661
mpirun -n 32 python flow_past_cylinder.py --Re 1662
mpirun -n 32 python flow_past_cylinder.py --Re 1663
mpirun -n 32 python flow_past_cylinder.py --Re 1664
mpirun -n 32 python flow_past_cylinder.py --Re 1665
mpirun -n 32 python flow_past_cylinder.py --Re 1666
mpirun -n 32 python flow_past_cylinder.py --Re 1667
mpirun -n 32 python flow_past_cylinder.py --Re 1668
mpirun -n 32 python flow_past_cylinder.py --Re 1669
mpirun -n 32 python flow_past_cylinder.py --Re 1670
mpirun -n 32 python flow_past_cylinder.py --Re 1671
mpirun -n 32 python flow_past_cylinder.py --Re 1672
mpirun -n 32 python flow_past_cylinder.py --Re 1673
mpirun -n 32 python flow_past_cylinder.py --Re 1674
mpirun -n 32 python flow_past_cylinder.py --Re 1675
mpirun -n 32 python flow_past_cylinder.py --Re 1676
mpirun -n 32 python flow_past_cylinder.py --Re 1677
mpirun -n 32 python flow_past_cylinder.py --Re 1678
mpirun -n 32 python flow_past_cylinder.py --Re 1679
mpirun -n 32 python flow_past_cylinder.py --Re 1680
mpirun -n 32 python flow_past_cylinder.py --Re 1681
mpirun -n 32 python flow_past_cylinder.py --Re 1682
mpirun -n 32 python flow_past_cylinder.py --Re 1683
