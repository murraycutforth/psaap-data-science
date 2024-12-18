# This python script generates shell scripts used to run simulations on the Yellowstone supercomputer.
# In this case, we sample Reynolds numbers from three clusters, defined by a Gaussian mixture model.

import pathlib
import math

import numpy as np

NUM_CLUSTERS = 3
MU = [250, 750, 1500]
SIGMA = 50
NUM_SAMPLES = 1000
TOTAL_HOURS = 24
SIMS_PER_HOUR_PER_NODE = 2

def num_nodes_required():
    return math.ceil(NUM_SAMPLES / (TOTAL_HOURS * SIMS_PER_HOUR_PER_NODE))

print(f'Number of nodes required: {num_nodes_required()}')

def generate_script(re_list: list, script_ind: int) -> pathlib.Path:
    script_name = pathlib.Path(f'run_{script_ind}.sh')

    with open(script_name, 'w') as f:
        f.write('#!/bin/bash\n')
        f.write(f'#SBATCH -J fenicsx_{script_ind}\n')
        f.write('#SBATCH -N 1\n')
        f.write('#SBATCH -t 24:00:00\n')
        f.write('#SBATCH -p cpu\n')
        f.write('eval "$(/opt/ohpc/pub/compiler/anaconda3/2024.02-1/bin/conda shell.bash hook)"\n')
        f.write('conda activate fenicsx-env\n')
        f.write('cd /home/darve/mcc4/psaap-data-science/multimodal-toy-problems/fenics\n')
        for re in re_list:
            f.write(f'python flow_past_cylinder.py --Re {re}\n')

    return script_name


def sample_reynolds_number():
    cluster = np.random.choice(NUM_CLUSTERS)
    return np.random.normal(MU[cluster], SIGMA)


def chunk_re_numbers():
    re_list = [sample_reynolds_number() for _ in range(NUM_SAMPLES)]
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


