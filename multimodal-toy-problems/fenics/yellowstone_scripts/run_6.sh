#!/bin/bash
#SBATCH -J fenicsx_6
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 388
python flow_past_cylinder.py --Re 389
python flow_past_cylinder.py --Re 390
python flow_past_cylinder.py --Re 391
python flow_past_cylinder.py --Re 392
python flow_past_cylinder.py --Re 393
python flow_past_cylinder.py --Re 394
python flow_past_cylinder.py --Re 395
python flow_past_cylinder.py --Re 396
python flow_past_cylinder.py --Re 397
python flow_past_cylinder.py --Re 398
python flow_past_cylinder.py --Re 399
python flow_past_cylinder.py --Re 400
python flow_past_cylinder.py --Re 401
python flow_past_cylinder.py --Re 402
python flow_past_cylinder.py --Re 403
python flow_past_cylinder.py --Re 404
python flow_past_cylinder.py --Re 405
python flow_past_cylinder.py --Re 406
python flow_past_cylinder.py --Re 407
python flow_past_cylinder.py --Re 408
python flow_past_cylinder.py --Re 409
python flow_past_cylinder.py --Re 410
python flow_past_cylinder.py --Re 411
python flow_past_cylinder.py --Re 412
python flow_past_cylinder.py --Re 413
python flow_past_cylinder.py --Re 414
python flow_past_cylinder.py --Re 415
python flow_past_cylinder.py --Re 416
python flow_past_cylinder.py --Re 417
python flow_past_cylinder.py --Re 418
python flow_past_cylinder.py --Re 419
python flow_past_cylinder.py --Re 420
python flow_past_cylinder.py --Re 421
python flow_past_cylinder.py --Re 422
python flow_past_cylinder.py --Re 423
python flow_past_cylinder.py --Re 424
python flow_past_cylinder.py --Re 425
python flow_past_cylinder.py --Re 426
python flow_past_cylinder.py --Re 427
python flow_past_cylinder.py --Re 428
python flow_past_cylinder.py --Re 429
python flow_past_cylinder.py --Re 430
python flow_past_cylinder.py --Re 431
python flow_past_cylinder.py --Re 432
python flow_past_cylinder.py --Re 433
python flow_past_cylinder.py --Re 434
python flow_past_cylinder.py --Re 435
