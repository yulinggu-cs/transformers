
#!/bin/bash
#SBATCH --gres=gpu:1
#SBATCH --mem=16000
#SBATCH --time=0:30:00
#SBATCH --job-name="nlu_hw4"

module purge
module load anaconda3/5.3.1
module load cuda/10.0.130
module load gcc/6.3.0

# Replace with your NetID
NETID=fs45
source activate /scratch/${NETID}/nlu/env
TASK_NAME=blimptask
#GLUE_DIR=/scratch/fs45/nlu/data

BLIMP_DIR=/scratch/fs45/nlu/data/blimp/data/

#export PYTORCH_TRANSFORMERS_CACHE=/scratch/${NETID}/nlu/cache
#conda install pytorch torchvision -c pytorch
cd /scratch/${NETID}/nlu/code/transformers
export PYTHONPATH=/scratch/${NETID}/nlu/code/transformers/src:$PYTHONPATH
python -c "import torch"
python /scratch/${NETID}/nlu/code/transformers/examples/run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name ${TASK_NAME} \
    --do_train \
    --do_eval \
    --data_dir ${BLIMP_DIR}/${TASK_NAME} \
    --max_seq_length 128 \
    --per_gpu_eval_batch_size=8   \
    --per_gpu_train_batch_size=8   \
    --learning_rate 2e-5 \
    --num_train_epochs 3.0 \
    --output_dir /scratch/${NETID}/nlu/${TASK_NAME}_run/
