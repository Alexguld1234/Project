#!/bin/sh
### General options
### -- specify queue --
#BSUB -q gpua100
### -- set the job Name --
#BSUB -J throwoff_roll_out_2
### -- Specify the output and error file. %J is the job-id --
#BSUB -o throwoff_roll_out_2_%J.out
#BSUB -e throwoff_roll_out_2_%J.err
### -- ask for number of cores (default: 1) --
#BSUB -n 4
### -- Select the resources: 1 GPU in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- set walltime limit: hh:mm --
#BSUB -W 72:00
# Request 16GB of system memory
#BSUB -R "rusage[mem=16GB]"

#BSUB -M 16GB
#BSUB -u s224228@dtu.dk
#BSUB -B
#BSUB -N
source /zhome/44/7/187366/Deep/bin/activate


CUDA_VISIBLE_DEVICES=0 python run_src/do_generate.py \
    --dataset_name GSM8K\
    --test_json_filename test_all_throwoff \
    --model_ckpt microsoft/Phi-3.5-vision-instruct\
    --note default \
    --num_rollouts  \
    --start_idx 0 \
    --end_idx 198
