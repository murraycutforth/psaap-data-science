#!/bin/bash
#SBATCH -J fenicsx_8
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 484
python flow_past_cylinder.py --Re 485
python flow_past_cylinder.py --Re 486
python flow_past_cylinder.py --Re 487
python flow_past_cylinder.py --Re 488
python flow_past_cylinder.py --Re 489
python flow_past_cylinder.py --Re 490
python flow_past_cylinder.py --Re 491
python flow_past_cylinder.py --Re 492
python flow_past_cylinder.py --Re 493
python flow_past_cylinder.py --Re 494
python flow_past_cylinder.py --Re 495
python flow_past_cylinder.py --Re 496
python flow_past_cylinder.py --Re 497
python flow_past_cylinder.py --Re 498
python flow_past_cylinder.py --Re 499
python flow_past_cylinder.py --Re 500
python flow_past_cylinder.py --Re 501
python flow_past_cylinder.py --Re 502
python flow_past_cylinder.py --Re 503
python flow_past_cylinder.py --Re 504
python flow_past_cylinder.py --Re 505
python flow_past_cylinder.py --Re 506
python flow_past_cylinder.py --Re 507
python flow_past_cylinder.py --Re 508
python flow_past_cylinder.py --Re 509
python flow_past_cylinder.py --Re 510
python flow_past_cylinder.py --Re 511
python flow_past_cylinder.py --Re 512
python flow_past_cylinder.py --Re 513
python flow_past_cylinder.py --Re 514
python flow_past_cylinder.py --Re 515
python flow_past_cylinder.py --Re 516
python flow_past_cylinder.py --Re 517
python flow_past_cylinder.py --Re 518
python flow_past_cylinder.py --Re 519
python flow_past_cylinder.py --Re 520
python flow_past_cylinder.py --Re 521
python flow_past_cylinder.py --Re 522
python flow_past_cylinder.py --Re 523
python flow_past_cylinder.py --Re 524
python flow_past_cylinder.py --Re 525
python flow_past_cylinder.py --Re 526
python flow_past_cylinder.py --Re 527
python flow_past_cylinder.py --Re 528
python flow_past_cylinder.py --Re 529
python flow_past_cylinder.py --Re 530
python flow_past_cylinder.py --Re 531
