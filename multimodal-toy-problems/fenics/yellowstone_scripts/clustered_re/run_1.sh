#!/bin/bash
#SBATCH -J fenicsx_1
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 672.6258852786539
python flow_past_cylinder.py --Re 1473.7704430137107
python flow_past_cylinder.py --Re 232.14758883760987
python flow_past_cylinder.py --Re 804.6680771638931
python flow_past_cylinder.py --Re 226.33329556634672
python flow_past_cylinder.py --Re 1560.800966745877
python flow_past_cylinder.py --Re 784.5702130795861
python flow_past_cylinder.py --Re 1477.2927310746747
python flow_past_cylinder.py --Re 666.088052728819
python flow_past_cylinder.py --Re 315.58002151941304
python flow_past_cylinder.py --Re 1427.0205748394812
python flow_past_cylinder.py --Re 245.6470147341239
python flow_past_cylinder.py --Re 327.33480970350763
python flow_past_cylinder.py --Re 1574.75228350209
python flow_past_cylinder.py --Re 1527.2561928724656
python flow_past_cylinder.py --Re 760.9103464673703
python flow_past_cylinder.py --Re 1574.9648994434685
python flow_past_cylinder.py --Re 702.0706794606724
python flow_past_cylinder.py --Re 793.7484186439369
python flow_past_cylinder.py --Re 1449.8324166518655
python flow_past_cylinder.py --Re 776.8496397697321
python flow_past_cylinder.py --Re 770.5797998372925
python flow_past_cylinder.py --Re 1382.0198795574188
python flow_past_cylinder.py --Re 827.5595405217073
python flow_past_cylinder.py --Re 264.7882155899295
python flow_past_cylinder.py --Re 1430.000854604376
python flow_past_cylinder.py --Re 793.3277110715826
python flow_past_cylinder.py --Re 1469.3407658383169
python flow_past_cylinder.py --Re 1466.956967964993
python flow_past_cylinder.py --Re 307.34365877145274
python flow_past_cylinder.py --Re 203.62851232184192
python flow_past_cylinder.py --Re 1516.6596491043156
python flow_past_cylinder.py --Re 1452.2945181627902
python flow_past_cylinder.py --Re 764.6534879381492
python flow_past_cylinder.py --Re 1512.463021116451
python flow_past_cylinder.py --Re 780.4053562173771
python flow_past_cylinder.py --Re 820.5374110423857
python flow_past_cylinder.py --Re 1383.7922763082088
python flow_past_cylinder.py --Re 1523.283695754537
python flow_past_cylinder.py --Re 1489.1198323779888
python flow_past_cylinder.py --Re 1552.5220967183088
python flow_past_cylinder.py --Re 891.995394396868
python flow_past_cylinder.py --Re 1492.8270695194878
python flow_past_cylinder.py --Re 793.3650026604874
python flow_past_cylinder.py --Re 713.6855655585523
python flow_past_cylinder.py --Re 716.733067399482
python flow_past_cylinder.py --Re 250.75182432204303
python flow_past_cylinder.py --Re 829.9246208725142
