# bash ./scripts/xd_test_cde.sh caltech101
TRAINER=DAM
CFG=xd
SHOTS=16
LOADEP=5

S_DATASET=imagenet
OUTPUT_DIR=./results
DATA=your_path_to_dataset
DIRGPT=./gpt_data

DATASET=$1
SEED=$2
GPU=$3


DIR=${OUTPUT_DIR}/output_img/evaluation/${TRAINER}/${CFG}_shots_${SHOTS}/${DATASET}/seed${SEED}
if [ -d "$DIR" ]; then
    echo "Oops! The results exist at ${DIR} (so skip this job)"
else
    CUDA_VISIBLE_DEVICES=${GPU} python train.py \
    --root ${DATA} \
    --seed ${SEED} \
    --trainer ${TRAINER} \
    --dataset-config-file configs/datasets/b2n/${DATASET}.yaml \
    --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
    --output-dir ${DIR} \
    --model-dir ${OUTPUT_DIR}/output_img/${S_DATASET}/${TRAINER}/${CFG}_shots_${SHOTS}/seed${SEED} \
    --load-epoch ${LOADEP} \
    --eval-only \
    --xd \
    --cd \
    DATASET.GPT_DIR ${DIRGPT}
    fi