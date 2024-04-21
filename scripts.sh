#!/bin/bash

# Set the training arguments
model_arguments=(
  --pretrained_model_name_or_path="/root/workspace/model/v1-5-pruned-emaonly.safetensors"
)

training_arguments=(
  --output_dir="/workspace/fine_tune/outputs/onepiece"
  --output_name="onepiece"
  --save_precision="fp16"
  --save_every_n_steps=2000
  --xformers
  --gradient_checkpointing
  --gradient_accumulation_steps=3
  --mixed_precision="fp16"
  --max_train_steps=10000
)

dataset_arguments=(
  --dataset_config=/root/workspace/dataset_config.toml
)

sample_prompt_arguments=(
  --sample_prompts='/root/workspace/prompt.txt'
  --sample_every_n_steps=200
  --sample_sampler="euler_a"
)

optimizer_arguments=(
  --optimizer_type="AdamW"
  --learning_rate=1e-5
  --lr_scheduler="cosine_with_restarts"
  --max_grad_norm=1.0
)

saving_arguments=(
  --save_model_as="safetensors"
)

logging_arguments=(
  --log_with="wandb"
  --log_tracker_name="one-piece-sd1.5"
  --logging_dir="/workspace/fine_tune/logs"
  --wandb_run_name="tep"
)

save_to_hub_config=(
  --huggingface_repo_type="model"
  --huggingface_path_in_repo="model/onepiece-sd-v1-5"
  --huggingface_token="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"
  --async_upload
  --save_state_to_huggingface
  --huggingface_repo_visibility="private"
)

# Run the training command
cd sd-scripts-mine
accelerate launch fine_tune.py \
  "${model_arguments[@]}" \
  "${training_arguments[@]}" \
  "${dataset_arguments[@]}" \
  "${sample_prompt_arguments[@]}" \
  "${optimizer_arguments[@]}" \
  "${saving_arguments[@]}" \
  "${logging_arguments[@]}" \
  "${save_to_hub_config[@]}"