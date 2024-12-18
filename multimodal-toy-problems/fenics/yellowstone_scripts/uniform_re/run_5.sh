#!/bin/bash
#SBATCH -J fenicsx_5
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 340
python flow_past_cylinder.py --Re 341
python flow_past_cylinder.py --Re 342
python flow_past_cylinder.py --Re 343
python flow_past_cylinder.py --Re 344
python flow_past_cylinder.py --Re 345
python flow_past_cylinder.py --Re 346
python flow_past_cylinder.py --Re 347
python flow_past_cylinder.py --Re 348
python flow_past_cylinder.py --Re 349
python flow_past_cylinder.py --Re 350
python flow_past_cylinder.py --Re 351
python flow_past_cylinder.py --Re 352
python flow_past_cylinder.py --Re 353
python flow_past_cylinder.py --Re 354
python flow_past_cylinder.py --Re 355
python flow_past_cylinder.py --Re 356
python flow_past_cylinder.py --Re 357
python flow_past_cylinder.py --Re 358
python flow_past_cylinder.py --Re 359
python flow_past_cylinder.py --Re 360
python flow_past_cylinder.py --Re 361
python flow_past_cylinder.py --Re 362
python flow_past_cylinder.py --Re 363
python flow_past_cylinder.py --Re 364
python flow_past_cylinder.py --Re 365
python flow_past_cylinder.py --Re 366
python flow_past_cylinder.py --Re 367
python flow_past_cylinder.py --Re 368
python flow_past_cylinder.py --Re 369
python flow_past_cylinder.py --Re 370
python flow_past_cylinder.py --Re 371
python flow_past_cylinder.py --Re 372
python flow_past_cylinder.py --Re 373
python flow_past_cylinder.py --Re 374
python flow_past_cylinder.py --Re 375
python flow_past_cylinder.py --Re 376
python flow_past_cylinder.py --Re 377
python flow_past_cylinder.py --Re 378
python flow_past_cylinder.py --Re 379
python flow_past_cylinder.py --Re 380
python flow_past_cylinder.py --Re 381
python flow_past_cylinder.py --Re 382
python flow_past_cylinder.py --Re 383
python flow_past_cylinder.py --Re 384
python flow_past_cylinder.py --Re 385
python flow_past_cylinder.py --Re 386
python flow_past_cylinder.py --Re 387
