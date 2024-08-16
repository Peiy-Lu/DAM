GPU=0
bash scripts/xd_train.sh ${GPU}
seed=$1
for dataset in imagenetv2 imagenet_sketch imagenet_a imagenet_r
do
    for seed in 1 2 3
    do
        bash scripts/xd_test_dg.sh ${dataset} ${seed} ${GPU}
    done
done

for dataset in caltech101 oxford_pets stanford_cars oxford_flowers food101 fgvc_aircraft sun397 dtd eurosat ucf101
do
    for seed in 1 2 3
    do
        bash scripts/xd_test_cde.sh ${dataset} ${seed} ${GPU}
    done
done