#!/bin/bash
#SBATCH -J fenicsx_37
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1876
python flow_past_cylinder.py --Re 1877
python flow_past_cylinder.py --Re 1878
python flow_past_cylinder.py --Re 1879
python flow_past_cylinder.py --Re 1880
python flow_past_cylinder.py --Re 1881
python flow_past_cylinder.py --Re 1882
python flow_past_cylinder.py --Re 1883
python flow_past_cylinder.py --Re 1884
python flow_past_cylinder.py --Re 1885
python flow_past_cylinder.py --Re 1886
python flow_past_cylinder.py --Re 1887
python flow_past_cylinder.py --Re 1888
python flow_past_cylinder.py --Re 1889
python flow_past_cylinder.py --Re 1890
python flow_past_cylinder.py --Re 1891
python flow_past_cylinder.py --Re 1892
python flow_past_cylinder.py --Re 1893
python flow_past_cylinder.py --Re 1894
python flow_past_cylinder.py --Re 1895
python flow_past_cylinder.py --Re 1896
python flow_past_cylinder.py --Re 1897
python flow_past_cylinder.py --Re 1898
python flow_past_cylinder.py --Re 1899
python flow_past_cylinder.py --Re 1900
python flow_past_cylinder.py --Re 1901
python flow_past_cylinder.py --Re 1902
python flow_past_cylinder.py --Re 1903
python flow_past_cylinder.py --Re 1904
python flow_past_cylinder.py --Re 1905
python flow_past_cylinder.py --Re 1906
python flow_past_cylinder.py --Re 1907
python flow_past_cylinder.py --Re 1908
python flow_past_cylinder.py --Re 1909
python flow_past_cylinder.py --Re 1910
python flow_past_cylinder.py --Re 1911
python flow_past_cylinder.py --Re 1912
python flow_past_cylinder.py --Re 1913
python flow_past_cylinder.py --Re 1914
python flow_past_cylinder.py --Re 1915
python flow_past_cylinder.py --Re 1916
python flow_past_cylinder.py --Re 1917
python flow_past_cylinder.py --Re 1918
python flow_past_cylinder.py --Re 1919
python flow_past_cylinder.py --Re 1920
python flow_past_cylinder.py --Re 1921
python flow_past_cylinder.py --Re 1922
python flow_past_cylinder.py --Re 1923
