#!/bin/bash
#SBATCH -j fenicsx_27
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
mpirun -n 32 python flow_past_cylinder.py --Re 1396
mpirun -n 32 python flow_past_cylinder.py --Re 1397
mpirun -n 32 python flow_past_cylinder.py --Re 1398
mpirun -n 32 python flow_past_cylinder.py --Re 1399
mpirun -n 32 python flow_past_cylinder.py --Re 1400
mpirun -n 32 python flow_past_cylinder.py --Re 1401
mpirun -n 32 python flow_past_cylinder.py --Re 1402
mpirun -n 32 python flow_past_cylinder.py --Re 1403
mpirun -n 32 python flow_past_cylinder.py --Re 1404
mpirun -n 32 python flow_past_cylinder.py --Re 1405
mpirun -n 32 python flow_past_cylinder.py --Re 1406
mpirun -n 32 python flow_past_cylinder.py --Re 1407
mpirun -n 32 python flow_past_cylinder.py --Re 1408
mpirun -n 32 python flow_past_cylinder.py --Re 1409
mpirun -n 32 python flow_past_cylinder.py --Re 1410
mpirun -n 32 python flow_past_cylinder.py --Re 1411
mpirun -n 32 python flow_past_cylinder.py --Re 1412
mpirun -n 32 python flow_past_cylinder.py --Re 1413
mpirun -n 32 python flow_past_cylinder.py --Re 1414
mpirun -n 32 python flow_past_cylinder.py --Re 1415
mpirun -n 32 python flow_past_cylinder.py --Re 1416
mpirun -n 32 python flow_past_cylinder.py --Re 1417
mpirun -n 32 python flow_past_cylinder.py --Re 1418
mpirun -n 32 python flow_past_cylinder.py --Re 1419
mpirun -n 32 python flow_past_cylinder.py --Re 1420
mpirun -n 32 python flow_past_cylinder.py --Re 1421
mpirun -n 32 python flow_past_cylinder.py --Re 1422
mpirun -n 32 python flow_past_cylinder.py --Re 1423
mpirun -n 32 python flow_past_cylinder.py --Re 1424
mpirun -n 32 python flow_past_cylinder.py --Re 1425
mpirun -n 32 python flow_past_cylinder.py --Re 1426
mpirun -n 32 python flow_past_cylinder.py --Re 1427
mpirun -n 32 python flow_past_cylinder.py --Re 1428
mpirun -n 32 python flow_past_cylinder.py --Re 1429
mpirun -n 32 python flow_past_cylinder.py --Re 1430
mpirun -n 32 python flow_past_cylinder.py --Re 1431
mpirun -n 32 python flow_past_cylinder.py --Re 1432
mpirun -n 32 python flow_past_cylinder.py --Re 1433
mpirun -n 32 python flow_past_cylinder.py --Re 1434
mpirun -n 32 python flow_past_cylinder.py --Re 1435
mpirun -n 32 python flow_past_cylinder.py --Re 1436
mpirun -n 32 python flow_past_cylinder.py --Re 1437
mpirun -n 32 python flow_past_cylinder.py --Re 1438
mpirun -n 32 python flow_past_cylinder.py --Re 1439
mpirun -n 32 python flow_past_cylinder.py --Re 1440
mpirun -n 32 python flow_past_cylinder.py --Re 1441
mpirun -n 32 python flow_past_cylinder.py --Re 1442
mpirun -n 32 python flow_past_cylinder.py --Re 1443
