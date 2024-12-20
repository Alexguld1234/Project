#!/bin/sh
### General options
### -- specify queue --
#BSUB -q gpua100
### -- set the job Name --
#BSUB -J TEST
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- Select the resources: 1 GPU in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set walltime limit: hh:mm --
#BSUB -W 1:00
# Request 1GB of system memory
#BSUB -R "span[hosts=1]"    # Ensures that all cores or tasks requested by the job run on a single host (node)
#BSUB -R "rusage[mem=16GB]"
### -- Specify the output and error file. %J is the job-id --
#BSUB -o TestJob_%J.out
#BSUB -e TestJob_%J.err



module load cuda/12.4

# Simple test command
echo "Running a test job on the HPC node..."
echo "Adding 2 + 2..."
result=$((2 + 2))
echo "Result: $result"
