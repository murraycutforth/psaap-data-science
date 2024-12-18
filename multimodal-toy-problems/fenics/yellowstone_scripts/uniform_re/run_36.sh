#!/bin/bash
#SBATCH -J fenicsx_36
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1828
python flow_past_cylinder.py --Re 1829
python flow_past_cylinder.py --Re 1830
python flow_past_cylinder.py --Re 1831
python flow_past_cylinder.py --Re 1832
python flow_past_cylinder.py --Re 1833
python flow_past_cylinder.py --Re 1834
python flow_past_cylinder.py --Re 1835
python flow_past_cylinder.py --Re 1836
python flow_past_cylinder.py --Re 1837
python flow_past_cylinder.py --Re 1838
python flow_past_cylinder.py --Re 1839
python flow_past_cylinder.py --Re 1840
python flow_past_cylinder.py --Re 1841
python flow_past_cylinder.py --Re 1842
python flow_past_cylinder.py --Re 1843
python flow_past_cylinder.py --Re 1844
python flow_past_cylinder.py --Re 1845
python flow_past_cylinder.py --Re 1846
python flow_past_cylinder.py --Re 1847
python flow_past_cylinder.py --Re 1848
python flow_past_cylinder.py --Re 1849
python flow_past_cylinder.py --Re 1850
python flow_past_cylinder.py --Re 1851
python flow_past_cylinder.py --Re 1852
python flow_past_cylinder.py --Re 1853
python flow_past_cylinder.py --Re 1854
python flow_past_cylinder.py --Re 1855
python flow_past_cylinder.py --Re 1856
python flow_past_cylinder.py --Re 1857
python flow_past_cylinder.py --Re 1858
python flow_past_cylinder.py --Re 1859
python flow_past_cylinder.py --Re 1860
python flow_past_cylinder.py --Re 1861
python flow_past_cylinder.py --Re 1862
python flow_past_cylinder.py --Re 1863
python flow_past_cylinder.py --Re 1864
python flow_past_cylinder.py --Re 1865
python flow_past_cylinder.py --Re 1866
python flow_past_cylinder.py --Re 1867
python flow_past_cylinder.py --Re 1868
python flow_past_cylinder.py --Re 1869
python flow_past_cylinder.py --Re 1870
python flow_past_cylinder.py --Re 1871
python flow_past_cylinder.py --Re 1872
python flow_past_cylinder.py --Re 1873
python flow_past_cylinder.py --Re 1874
python flow_past_cylinder.py --Re 1875
