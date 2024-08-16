# bash ./scripts/xd_train.sh
TRAINER=DAM
CFG=xd
SHOTS=16
GPU=$1

S_DATASET=imagenet
OUTPUT_DIR=./results
DATA=your_path_to_dataset
DIRGPT=./gpt_data

for SEED in 1
do

    DIR=${OUTPUT_DIR}/output_img/${S_DATASET}/${TRAINER}/${CFG}_shots_${SHOTS}/seed${SEED}
    if [ -d "$DIR" ]; then
        echo "Oops! The results exist at ${DIR} (so skip this job)"
    else
        CUDA_VISIBLE_DEVICES=${GPU} python train.py \
        --root ${DATA} \
        --seed ${SEED} \
        --trainer ${TRAINER} \
        --dataset-config-file configs/datasets/b2n/${S_DATASET}.yaml \
        --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
        --output-dir ${DIR} \
        --xd \
        --cd \
        DATASET.GPT_DIR ${DIRGPT} \
        DATASET.NUM_SHOTS ${SHOTS}
    fi
done