export PYTHONPATH=/home/jupyter/transformers/src:$PYTHONPATH
python ./examples/run_glue.py \
	--data_dir /home/jupyter/blimp_single/  \
	--blimp_train subject_verb_agreement	\
	--blimp_eval binding \
	--model_type bert \
	--model_name_or_path /home/jupyter/blimp_sva \
	--task_name blimp-single \
	--do_eval \
	--per_gpu_eval_batch_size=32  \
	--per_gpu_train_batch_size=32   \
	--learning_rate 2e-5 \
	--num_train_epochs 3.0 \
	--max_seq_length 64 \
	--overwrite_cache \
	--output_dir /home/jupyter/blimp_sva/

