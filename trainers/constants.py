def get_dataset_specified_config(dataset):
    """Get dataset specific."""
    cfg = {
        "ImageNet": {
            "TRAINER.W": 9.0,
            "DATALOADER.TRAIN_X.BATCH_SIZE": 4,
            "DATALOADER.TEST.BATCH_SIZE": 16,
            "OPTIM.MAX_EPOCH": 10,
        },
        "Caltech101": {
            "TRAINER.W": 8.0,
            "INPUT.TRANSFORMS": ["randaugment", "normalize"],
        },
        "OxfordPets": {
            "TRAINER.W": 7.0,   
        },
        "StanfordCars": {   
            "TRAINER.W": 6.0,
            "TRAINER.I_M": 0.2,
            "TRAINER.T_M": 0.2,
        },
        "OxfordFlowers": {
            "TRAINER.W": 8.0,
            "TRAINER.I_M": 0.9,
            "TRAINER.T_M": 0.9,
            "TRAINER.DAM.N_TPRO": 4,
        },
        "Food101": {
            "TRAINER.W": 8.0,
        },
        "FGVCAircraft": {
            "TRAINER.W": 4.0,
            "TRAINER.I_M": 0.5,
            "TRAINER.T_M": 0.5,
            "TRAINER.DAM.N_TPRO": 4,
            "INPUT.TRANSFORMS": ["random_resized_crop", "random_flip", "normalize"],
        },
        "SUN397": {
            "TRAINER.W": 6.0,
        },
        "DescribableTextures": {
            "TRAINER.W": 8.0,
            "TRAINER.I_M": 0.2,
            "TRAINER.T_M": 0.2,
            "INPUT.TRANSFORMS": ["randaugment", "normalize"],
        },
        "EuroSAT": {
            "TRAINER.W": 7.0,
            "TRAINER.I_M": 0.4,
            "TRAINER.T_M": 0.4,
            "TRAINER.DAM.N_TPRO": 4,
            "INPUT.TRANSFORMS": ["randaugment", "normalize"],
        },
        "UCF101": {
            "TRAINER.W": 7.0,
        },
    }.get(dataset, {})

    return [item for sublist in cfg.items() for item in sublist]
