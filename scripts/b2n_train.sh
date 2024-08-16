# bash ./scripts/b2n_train.sh caltech101
TRAINER=DAM
CFG=b2n

OUTPUT_DIR=./results
DATA=your_path_to_dataset
DIRGPT=./gpt_data

DATASET=$1
SEED=$2
SHOTS=$3
GPU=$4

COMMON_DIR=${DATASET}/${TRAINER}/shots_${SHOTS}/seed${SEED}
DIRTRAIN=${OUTPUT_DIR}/output/B2N/train_base/${COMMON_DIR}

if [ -d "$DIRTRAIN" ]; then
    echo "Oops! The results exist at ${DIRTRAIN} (so skip this job)"
else
    CUDA_VISIBLE_DEVICES=${GPU} python train.py \
    --root ${DATA} \
    --seed ${SEED} \
    --trainer ${TRAINER} \
    --dataset-config-file configs/datasets/b2n/${DATASET}.yaml \
    --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
    --output-dir ${DIRTRAIN} \
    DATASET.GPT_DIR ${DIRGPT} \
    DATASET.NUM_SHOTS ${SHOTS} \
    DATASET.SUBSAMPLE_CLASSES base
fi

