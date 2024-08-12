TRAINER=DAM
CFG=b2n

OUTPUT_DIR=./results
DATA=/your_data_path
DIRGPT=./gpt_data

DATASET=$1
SEED=$2
SHOTS=$3
GPU=$4
LOADEP=$5

COMMON_DIR=${DATASET}/${TRAINER}/shots_${SHOTS}/seed${SEED}
DIRTRAIN=${OUTPUT_DIR}/output/B2N/train_base/${COMMON_DIR}
DIRTEST=${OUTPUT_DIR}/output/B2N/test_new/${COMMON_DIR}

if [ -d "$DIRTEST" ]; then
    echo "Oops! The results exist at ${DIRTEST} (so skip this job)"
else
    CUDA_VISIBLE_DEVICES=${GPU} python train.py \
    --root ${DATA} \
    --seed ${SEED} \
    --trainer ${TRAINER} \
    --dataset-config-file configs/datasets/b2n/${DATASET}.yaml \
    --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
    --output-dir ${DIRTEST} \
    --model-dir ${DIRTRAIN} \
    --load-epoch ${LOADEP} \
    --eval-only \
    DATASET.GPT_DIR ${DIRGPT} \
    DATASET.NUM_SHOTS ${SHOTS} \
    DATASET.SUBSAMPLE_CLASSES new
fi
