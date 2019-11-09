python ./train.py \
    --model_dir=./mount/temp/cifar10/model/resnet.decay98 \
    --batch_size=256 \
    --save_interval_epochs=5 \
    --metric_eval_interval_steps=0 \
    --valid_interval_epochs=1 \
    --inference_interval_epochs=5 \
    --learning_rate_decay_factor=0.98 \
    --num_epochs_per_decay=1. \
    --num_epochs=500 \
    --save_interval_steps 10000
