#!/bin/bash
#SBATCH -J fenicsx_9
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 532
python flow_past_cylinder.py --Re 533
python flow_past_cylinder.py --Re 534
python flow_past_cylinder.py --Re 535
python flow_past_cylinder.py --Re 536
python flow_past_cylinder.py --Re 537
python flow_past_cylinder.py --Re 538
python flow_past_cylinder.py --Re 539
python flow_past_cylinder.py --Re 540
python flow_past_cylinder.py --Re 541
python flow_past_cylinder.py --Re 542
python flow_past_cylinder.py --Re 543
python flow_past_cylinder.py --Re 544
python flow_past_cylinder.py --Re 545
python flow_past_cylinder.py --Re 546
python flow_past_cylinder.py --Re 547
python flow_past_cylinder.py --Re 548
python flow_past_cylinder.py --Re 549
python flow_past_cylinder.py --Re 550
python flow_past_cylinder.py --Re 551
python flow_past_cylinder.py --Re 552
python flow_past_cylinder.py --Re 553
python flow_past_cylinder.py --Re 554
python flow_past_cylinder.py --Re 555
python flow_past_cylinder.py --Re 556
python flow_past_cylinder.py --Re 557
python flow_past_cylinder.py --Re 558
python flow_past_cylinder.py --Re 559
python flow_past_cylinder.py --Re 560
python flow_past_cylinder.py --Re 561
python flow_past_cylinder.py --Re 562
python flow_past_cylinder.py --Re 563
python flow_past_cylinder.py --Re 564
python flow_past_cylinder.py --Re 565
python flow_past_cylinder.py --Re 566
python flow_past_cylinder.py --Re 567
python flow_past_cylinder.py --Re 568
python flow_past_cylinder.py --Re 569
python flow_past_cylinder.py --Re 570
python flow_past_cylinder.py --Re 571
python flow_past_cylinder.py --Re 572
python flow_past_cylinder.py --Re 573
python flow_past_cylinder.py --Re 574
python flow_past_cylinder.py --Re 575
python flow_past_cylinder.py --Re 576
python flow_past_cylinder.py --Re 577
python flow_past_cylinder.py --Re 578
python flow_past_cylinder.py --Re 579
