#!/bin/bash
#SBATCH -J fenicsx_4
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -p cpu
eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"
conda activate fenicsx-env
cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics
python flow_past_cylinder.py --Re 292
python flow_past_cylinder.py --Re 293
python flow_past_cylinder.py --Re 294
python flow_past_cylinder.py --Re 295
python flow_past_cylinder.py --Re 296
python flow_past_cylinder.py --Re 297
python flow_past_cylinder.py --Re 298
python flow_past_cylinder.py --Re 299
python flow_past_cylinder.py --Re 300
python flow_past_cylinder.py --Re 301
python flow_past_cylinder.py --Re 302
python flow_past_cylinder.py --Re 303
python flow_past_cylinder.py --Re 304
python flow_past_cylinder.py --Re 305
python flow_past_cylinder.py --Re 306
python flow_past_cylinder.py --Re 307
python flow_past_cylinder.py --Re 308
python flow_past_cylinder.py --Re 309
python flow_past_cylinder.py --Re 310
python flow_past_cylinder.py --Re 311
python flow_past_cylinder.py --Re 312
python flow_past_cylinder.py --Re 313
python flow_past_cylinder.py --Re 314
python flow_past_cylinder.py --Re 315
python flow_past_cylinder.py --Re 316
python flow_past_cylinder.py --Re 317
python flow_past_cylinder.py --Re 318
python flow_past_cylinder.py --Re 319
python flow_past_cylinder.py --Re 320
python flow_past_cylinder.py --Re 321
python flow_past_cylinder.py --Re 322
python flow_past_cylinder.py --Re 323
python flow_past_cylinder.py --Re 324
python flow_past_cylinder.py --Re 325
python flow_past_cylinder.py --Re 326
python flow_past_cylinder.py --Re 327
python flow_past_cylinder.py --Re 328
python flow_past_cylinder.py --Re 329
python flow_past_cylinder.py --Re 330
python flow_past_cylinder.py --Re 331
python flow_past_cylinder.py --Re 332
python flow_past_cylinder.py --Re 333
python flow_past_cylinder.py --Re 334
python flow_past_cylinder.py --Re 335
python flow_past_cylinder.py --Re 336
python flow_past_cylinder.py --Re 337
python flow_past_cylinder.py --Re 338
python flow_past_cylinder.py --Re 339
