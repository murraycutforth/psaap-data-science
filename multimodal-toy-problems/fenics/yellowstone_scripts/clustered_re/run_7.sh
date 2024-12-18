#!/bin/bash
#SBATCH -J fenicsx_7
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 806.0308901442824
python flow_past_cylinder.py --Re 310.6276232446145
python flow_past_cylinder.py --Re 1502.4553205434931
python flow_past_cylinder.py --Re 247.08865776928025
python flow_past_cylinder.py --Re 729.4943711859976
python flow_past_cylinder.py --Re 221.20812416455814
python flow_past_cylinder.py --Re 736.4216329674375
python flow_past_cylinder.py --Re 1531.4053765172298
python flow_past_cylinder.py --Re 169.25164625598677
python flow_past_cylinder.py --Re 1513.951819588073
python flow_past_cylinder.py --Re 778.1742503634385
python flow_past_cylinder.py --Re 323.0105042401781
python flow_past_cylinder.py --Re 219.74681396672463
python flow_past_cylinder.py --Re 323.6710555732964
python flow_past_cylinder.py --Re 271.6727340685616
python flow_past_cylinder.py --Re 724.7226196209028
python flow_past_cylinder.py --Re 302.2381117640853
python flow_past_cylinder.py --Re 1459.5321618692435
python flow_past_cylinder.py --Re 766.7036963613031
python flow_past_cylinder.py --Re 1481.7050682341244
python flow_past_cylinder.py --Re 307.8640213140648
python flow_past_cylinder.py --Re 1474.7236496634284
python flow_past_cylinder.py --Re 167.63415084320076
python flow_past_cylinder.py --Re 750.4720039280436
python flow_past_cylinder.py --Re 1567.6821729246558
python flow_past_cylinder.py --Re 731.286292069469
python flow_past_cylinder.py --Re 1437.961862514652
python flow_past_cylinder.py --Re 211.50041142074338
python flow_past_cylinder.py --Re 896.2689787806597
python flow_past_cylinder.py --Re 318.55595197119294
python flow_past_cylinder.py --Re 753.9916203613273
python flow_past_cylinder.py --Re 819.5070178871639
python flow_past_cylinder.py --Re 276.55465870440605
python flow_past_cylinder.py --Re 721.2265082082547
python flow_past_cylinder.py --Re 259.8711487862235
python flow_past_cylinder.py --Re 1469.099693114731
python flow_past_cylinder.py --Re 746.0852921714129
python flow_past_cylinder.py --Re 198.01595133411843
python flow_past_cylinder.py --Re 300.3370357387804
python flow_past_cylinder.py --Re 296.96308613868547
python flow_past_cylinder.py --Re 221.5637588794659
python flow_past_cylinder.py --Re 1498.5608523489216
python flow_past_cylinder.py --Re 734.7821244873452
python flow_past_cylinder.py --Re 747.3523173745921
python flow_past_cylinder.py --Re 1530.2748185639987
python flow_past_cylinder.py --Re 1526.5361722600428
python flow_past_cylinder.py --Re 1414.813739210363
python flow_past_cylinder.py --Re 1472.1857874474206
