export CUDA_LAUNCH_BLOCKING=1

gpu=0

for dataset in imagenet caltech101 oxford_pets stanford_cars oxford_flowers food101 fgvc_aircraft sun397 dtd eurosat ucf101
do
    for shot in 16
    do
        for seed in 1 2 3
        do
            bash scripts/b2n_train.sh ${dataset} ${seed} ${shot} ${gpu}
            bash scripts/b2n_test.sh ${dataset} ${seed} ${shot} ${gpu} ${LOADEP}
        done
    done
done