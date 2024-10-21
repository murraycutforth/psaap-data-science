#!/bin/bash
#SBATCH -j fenicsx_33
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1684
mpirun -n 32 python flow_past_cylinder.py --Re 1685
mpirun -n 32 python flow_past_cylinder.py --Re 1686
mpirun -n 32 python flow_past_cylinder.py --Re 1687
mpirun -n 32 python flow_past_cylinder.py --Re 1688
mpirun -n 32 python flow_past_cylinder.py --Re 1689
mpirun -n 32 python flow_past_cylinder.py --Re 1690
mpirun -n 32 python flow_past_cylinder.py --Re 1691
mpirun -n 32 python flow_past_cylinder.py --Re 1692
mpirun -n 32 python flow_past_cylinder.py --Re 1693
mpirun -n 32 python flow_past_cylinder.py --Re 1694
mpirun -n 32 python flow_past_cylinder.py --Re 1695
mpirun -n 32 python flow_past_cylinder.py --Re 1696
mpirun -n 32 python flow_past_cylinder.py --Re 1697
mpirun -n 32 python flow_past_cylinder.py --Re 1698
mpirun -n 32 python flow_past_cylinder.py --Re 1699
mpirun -n 32 python flow_past_cylinder.py --Re 1700
mpirun -n 32 python flow_past_cylinder.py --Re 1701
mpirun -n 32 python flow_past_cylinder.py --Re 1702
mpirun -n 32 python flow_past_cylinder.py --Re 1703
mpirun -n 32 python flow_past_cylinder.py --Re 1704
mpirun -n 32 python flow_past_cylinder.py --Re 1705
mpirun -n 32 python flow_past_cylinder.py --Re 1706
mpirun -n 32 python flow_past_cylinder.py --Re 1707
mpirun -n 32 python flow_past_cylinder.py --Re 1708
mpirun -n 32 python flow_past_cylinder.py --Re 1709
mpirun -n 32 python flow_past_cylinder.py --Re 1710
mpirun -n 32 python flow_past_cylinder.py --Re 1711
mpirun -n 32 python flow_past_cylinder.py --Re 1712
mpirun -n 32 python flow_past_cylinder.py --Re 1713
mpirun -n 32 python flow_past_cylinder.py --Re 1714
mpirun -n 32 python flow_past_cylinder.py --Re 1715
mpirun -n 32 python flow_past_cylinder.py --Re 1716
mpirun -n 32 python flow_past_cylinder.py --Re 1717
mpirun -n 32 python flow_past_cylinder.py --Re 1718
mpirun -n 32 python flow_past_cylinder.py --Re 1719
mpirun -n 32 python flow_past_cylinder.py --Re 1720
mpirun -n 32 python flow_past_cylinder.py --Re 1721
mpirun -n 32 python flow_past_cylinder.py --Re 1722
mpirun -n 32 python flow_past_cylinder.py --Re 1723
mpirun -n 32 python flow_past_cylinder.py --Re 1724
mpirun -n 32 python flow_past_cylinder.py --Re 1725
mpirun -n 32 python flow_past_cylinder.py --Re 1726
mpirun -n 32 python flow_past_cylinder.py --Re 1727
mpirun -n 32 python flow_past_cylinder.py --Re 1728
mpirun -n 32 python flow_past_cylinder.py --Re 1729
mpirun -n 32 python flow_past_cylinder.py --Re 1730
mpirun -n 32 python flow_past_cylinder.py --Re 1731
