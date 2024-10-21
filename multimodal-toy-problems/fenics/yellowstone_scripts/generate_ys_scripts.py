# This python script generates shell scripts used to run simulations on the Yellowstone supercomputer.

import pathlib
import math

RE_MIN = 100
RE_MAX = 2001
RE_STEP = 1
TOTAL_HOURS = 24
SIMS_PER_HOUR_PER_NODE = 2

def num_nodes_required():
    num_sims = (RE_MAX - RE_MIN) // RE_STEP
    return math.ceil(num_sims / (TOTAL_HOURS * SIMS_PER_HOUR_PER_NODE))

print(f'Number of nodes required: {num_nodes_required()}')

def generate_script(re_list: list, script_ind: int) -> pathlib.Path:
    script_name = pathlib.Path(f'run_{script_ind}.sh')

    with open(script_name, 'w') as f:
        f.write('#!/bin/bash\n')
        f.write(f'#SBATCH -j fenicsx_{script_ind}\n')
        f.write('#SBATCH -n 1\n')
        f.write('#SBATCH -t 24:00:00\n')
        f.write('#SBATCH -p cpu\n')
        f.write('eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"\n')
        f.write('conda activate fenicsx-env\n')
        f.write('cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics\n')
        for re in re_list:
            f.write(f'mpirun -n 32 python flow_past_cylinder.py --Re {re}\n')

    return script_name

def chunk_re_numbers():
    re_list = list(range(RE_MIN, RE_MAX, RE_STEP))
    num_scripts = num_nodes_required()
    chunk_size = math.ceil(len(re_list) / num_scripts)
    return [re_list[i:i + chunk_size] for i in range(0, len(re_list), chunk_size)]

re_chunks = chunk_re_numbers()
script_names = list(map(lambda x: generate_script(x[1], x[0]), enumerate(re_chunks)))

print(f'Generated {len(script_names)} scripts')

def generate_master_script(script_names: list):
    with open('run_all.sh', 'w') as f:
        f.write('#!/bin/bash\n')
        for script_name in script_names:
            f.write(f'sbatch {script_name}\n')

generate_master_script(script_names)

print('Generated master script')
print('Done')


