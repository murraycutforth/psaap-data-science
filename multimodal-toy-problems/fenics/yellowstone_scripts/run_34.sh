#!/bin/bash
#SBATCH -j fenicsx_34
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1732
mpirun -n 32 python flow_past_cylinder.py --Re 1733
mpirun -n 32 python flow_past_cylinder.py --Re 1734
mpirun -n 32 python flow_past_cylinder.py --Re 1735
mpirun -n 32 python flow_past_cylinder.py --Re 1736
mpirun -n 32 python flow_past_cylinder.py --Re 1737
mpirun -n 32 python flow_past_cylinder.py --Re 1738
mpirun -n 32 python flow_past_cylinder.py --Re 1739
mpirun -n 32 python flow_past_cylinder.py --Re 1740
mpirun -n 32 python flow_past_cylinder.py --Re 1741
mpirun -n 32 python flow_past_cylinder.py --Re 1742
mpirun -n 32 python flow_past_cylinder.py --Re 1743
mpirun -n 32 python flow_past_cylinder.py --Re 1744
mpirun -n 32 python flow_past_cylinder.py --Re 1745
mpirun -n 32 python flow_past_cylinder.py --Re 1746
mpirun -n 32 python flow_past_cylinder.py --Re 1747
mpirun -n 32 python flow_past_cylinder.py --Re 1748
mpirun -n 32 python flow_past_cylinder.py --Re 1749
mpirun -n 32 python flow_past_cylinder.py --Re 1750
mpirun -n 32 python flow_past_cylinder.py --Re 1751
mpirun -n 32 python flow_past_cylinder.py --Re 1752
mpirun -n 32 python flow_past_cylinder.py --Re 1753
mpirun -n 32 python flow_past_cylinder.py --Re 1754
mpirun -n 32 python flow_past_cylinder.py --Re 1755
mpirun -n 32 python flow_past_cylinder.py --Re 1756
mpirun -n 32 python flow_past_cylinder.py --Re 1757
mpirun -n 32 python flow_past_cylinder.py --Re 1758
mpirun -n 32 python flow_past_cylinder.py --Re 1759
mpirun -n 32 python flow_past_cylinder.py --Re 1760
mpirun -n 32 python flow_past_cylinder.py --Re 1761
mpirun -n 32 python flow_past_cylinder.py --Re 1762
mpirun -n 32 python flow_past_cylinder.py --Re 1763
mpirun -n 32 python flow_past_cylinder.py --Re 1764
mpirun -n 32 python flow_past_cylinder.py --Re 1765
mpirun -n 32 python flow_past_cylinder.py --Re 1766
mpirun -n 32 python flow_past_cylinder.py --Re 1767
mpirun -n 32 python flow_past_cylinder.py --Re 1768
mpirun -n 32 python flow_past_cylinder.py --Re 1769
mpirun -n 32 python flow_past_cylinder.py --Re 1770
mpirun -n 32 python flow_past_cylinder.py --Re 1771
mpirun -n 32 python flow_past_cylinder.py --Re 1772
mpirun -n 32 python flow_past_cylinder.py --Re 1773
mpirun -n 32 python flow_past_cylinder.py --Re 1774
mpirun -n 32 python flow_past_cylinder.py --Re 1775
mpirun -n 32 python flow_past_cylinder.py --Re 1776
mpirun -n 32 python flow_past_cylinder.py --Re 1777
mpirun -n 32 python flow_past_cylinder.py --Re 1778
mpirun -n 32 python flow_past_cylinder.py --Re 1779
