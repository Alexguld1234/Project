#!/bin/sh
### General options
### -- specify queue --
#BSUB -q gpua100
### -- set the job Name --
#BSUB -J Discriminator_run
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- Select the resources: 1 GPU in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set walltime limit: hh:mm --
#BSUB -W 24:00
# Request 16GB of system memory
#BSUB -R "rusage[mem=16GB]"
### -- Specify the output and error file. %J is the job-id --
#BSUB -o RstarJob_%J.out
#BSUB -e RstarJob_%J.err
#BSUB -M 16GB
#BSUB -u s224228@dtu.dk
#BSUB -B
#BSUB -N
source /zhome/44/7/187366/Deep/bin/activate



CUDA_VISIBLE_DEVICES=0 python run_src/do_discriminate.py \
    --model_ckpt microsoft/Phi-3-mini-4k-instruct \
    --root_dir run_outputs/GSM8KHARD/Phi-3.5-vision-instruct/2024-12-17_14-15-43---[default]\
    --dataset_name GSM8KHARD \
    --note default
    