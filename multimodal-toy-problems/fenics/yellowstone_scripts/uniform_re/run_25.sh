#!/bin/bash
#SBATCH -J fenicsx_25
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 1300
python flow_past_cylinder.py --Re 1301
python flow_past_cylinder.py --Re 1302
python flow_past_cylinder.py --Re 1303
python flow_past_cylinder.py --Re 1304
python flow_past_cylinder.py --Re 1305
python flow_past_cylinder.py --Re 1306
python flow_past_cylinder.py --Re 1307
python flow_past_cylinder.py --Re 1308
python flow_past_cylinder.py --Re 1309
python flow_past_cylinder.py --Re 1310
python flow_past_cylinder.py --Re 1311
python flow_past_cylinder.py --Re 1312
python flow_past_cylinder.py --Re 1313
python flow_past_cylinder.py --Re 1314
python flow_past_cylinder.py --Re 1315
python flow_past_cylinder.py --Re 1316
python flow_past_cylinder.py --Re 1317
python flow_past_cylinder.py --Re 1318
python flow_past_cylinder.py --Re 1319
python flow_past_cylinder.py --Re 1320
python flow_past_cylinder.py --Re 1321
python flow_past_cylinder.py --Re 1322
python flow_past_cylinder.py --Re 1323
python flow_past_cylinder.py --Re 1324
python flow_past_cylinder.py --Re 1325
python flow_past_cylinder.py --Re 1326
python flow_past_cylinder.py --Re 1327
python flow_past_cylinder.py --Re 1328
python flow_past_cylinder.py --Re 1329
python flow_past_cylinder.py --Re 1330
python flow_past_cylinder.py --Re 1331
python flow_past_cylinder.py --Re 1332
python flow_past_cylinder.py --Re 1333
python flow_past_cylinder.py --Re 1334
python flow_past_cylinder.py --Re 1335
python flow_past_cylinder.py --Re 1336
python flow_past_cylinder.py --Re 1337
python flow_past_cylinder.py --Re 1338
python flow_past_cylinder.py --Re 1339
python flow_past_cylinder.py --Re 1340
python flow_past_cylinder.py --Re 1341
python flow_past_cylinder.py --Re 1342
python flow_past_cylinder.py --Re 1343
python flow_past_cylinder.py --Re 1344
python flow_past_cylinder.py --Re 1345
python flow_past_cylinder.py --Re 1346
python flow_past_cylinder.py --Re 1347
