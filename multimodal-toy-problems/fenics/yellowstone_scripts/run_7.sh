#!/bin/bash
#SBATCH -J fenicsx_7
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 436
python flow_past_cylinder.py --Re 437
python flow_past_cylinder.py --Re 438
python flow_past_cylinder.py --Re 439
python flow_past_cylinder.py --Re 440
python flow_past_cylinder.py --Re 441
python flow_past_cylinder.py --Re 442
python flow_past_cylinder.py --Re 443
python flow_past_cylinder.py --Re 444
python flow_past_cylinder.py --Re 445
python flow_past_cylinder.py --Re 446
python flow_past_cylinder.py --Re 447
python flow_past_cylinder.py --Re 448
python flow_past_cylinder.py --Re 449
python flow_past_cylinder.py --Re 450
python flow_past_cylinder.py --Re 451
python flow_past_cylinder.py --Re 452
python flow_past_cylinder.py --Re 453
python flow_past_cylinder.py --Re 454
python flow_past_cylinder.py --Re 455
python flow_past_cylinder.py --Re 456
python flow_past_cylinder.py --Re 457
python flow_past_cylinder.py --Re 458
python flow_past_cylinder.py --Re 459
python flow_past_cylinder.py --Re 460
python flow_past_cylinder.py --Re 461
python flow_past_cylinder.py --Re 462
python flow_past_cylinder.py --Re 463
python flow_past_cylinder.py --Re 464
python flow_past_cylinder.py --Re 465
python flow_past_cylinder.py --Re 466
python flow_past_cylinder.py --Re 467
python flow_past_cylinder.py --Re 468
python flow_past_cylinder.py --Re 469
python flow_past_cylinder.py --Re 470
python flow_past_cylinder.py --Re 471
python flow_past_cylinder.py --Re 472
python flow_past_cylinder.py --Re 473
python flow_past_cylinder.py --Re 474
python flow_past_cylinder.py --Re 475
python flow_past_cylinder.py --Re 476
python flow_past_cylinder.py --Re 477
python flow_past_cylinder.py --Re 478
python flow_past_cylinder.py --Re 479
python flow_past_cylinder.py --Re 480
python flow_past_cylinder.py --Re 481
python flow_past_cylinder.py --Re 482
python flow_past_cylinder.py --Re 483
