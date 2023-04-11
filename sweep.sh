#!/bin/bash
#SBATCH --job-name=eye_clip_train
#SBATCH --gres gpu:6
#SBATCH --nodes 1
#SBATCH --cpus-per-task=30
#SBATCH --partition=multigpu



# for dataset in DomainNet 
# do
#     for lr in 0.00005 
#     do
#         for command in delete_incomplete launch
#         do
#             python -m domainbed.scripts.sweep $command\
#                 --data_dir=/nfs/users/ext_sanoojan.baliah/Sanoojan/DG/data \
#                 --output_dir=./domainbed/outputs_clip/Deitbase_related_ablations/ERM_Vit_with_clip_mix-0.6/${dataset}/lr-${lr}\
#                 --command_launcher multi_gpu_0_1\
#                 --algorithms ERM_Vit_with_clip_mix \
#                 --single_test_envs \
#                 --datasets ${dataset} \
#                 --n_hparams 1  \
#                 --n_trials 3 \
#                 --hparams """{\"weight_init\":\"ImageNet\",\"backbone\":\"DeitBase\",\"lr\":${lr}}"""\
#                 --skip_confirmation  
#         done > Outs/DeitBase-${dataset}-ERM_Vit_with_clip_mix.out
#     done
# done

nvidia-smi


# for lr in 0.000005 0.000002 0.000001 
# do
#     for dataset in DR
#     do
#         for init in clip_full
#         do
#             for command in delete_incomplete launch
#             do
#                 python -m domainbed.scripts.sweep $command\
#                     --data_dir=/nfs/users/ext_group8/Dataset/224_data/ \
#                     --output_dir=./domainbed/Outputs/ERM_ViT_learning_probing-CLIP/${lr}\
#                     --command_launcher multi_gpu\
#                     --algorithms ERM_ViT_learning_probing \
#                     --single_test_envs \
#                     --datasets ${dataset} \
#                     --n_hparams 1  \
#                     --n_trials 3 \
#                     --hparams """{\"lr\":${lr}}"""\
#                     --skip_confirmation  
#             done > Outs/ERM_ViT_learning_probing-CLIP.out
#         done
#     done
# done

# for lr in 0.000005 0.000002 0.000001 
# do
#     for dataset in DR
#     do
#         for init in clip_full
#         do
#             for command in delete_incomplete launch
#             do
#                 python -m domainbed.scripts.sweep $command\
#                     --data_dir=/nfs/users/ext_group8/Dataset/224_data/ \
#                     --output_dir=./domainbed/Outputs/Clip_train-CLIP/${lr}\
#                     --command_launcher multi_gpu\
#                     --algorithms Clip_train \
#                     --single_test_envs \
#                     --datasets ${dataset} \
#                     --n_hparams 1  \
#                     --n_trials 3 \
#                     --hparams """{\"lr\":${lr}}"""\
#                     --skip_confirmation  
#             done > Outs/Clip_train-CLIP.out
#         done
#     done
# done

for lr in 0.00005 0.000005 0.000002 0.000001 
do
    for dataset in DR
    do
        for init in ImageNet
        do
            for command in delete_incomplete launch
            do
                python -m domainbed.scripts.sweep $command\
                    --data_dir=/nfs/users/ext_group8/Dataset/224_data/ \
                    --output_dir=./domainbed/Outputs/ERM_ViT-Deitbase/${lr}\
                    --command_launcher multi_gpu\
                    --algorithms ERM_ViT \
                    --single_test_envs \
                    --datasets ${dataset} \
                    --n_hparams 1  \
                    --n_trials 3 \
                    --hparams """{\"weight_init\":\"${init}\",\"backbone\":\"ResNet50\",\"lr\":${lr}}"""\
                    --skip_confirmation  
            done > Outs/ERM_ViT-deitbase.out
        done
    done
done