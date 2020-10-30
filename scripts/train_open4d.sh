set -ex
name='open4d_pix2pix_nvs_baseline'
# python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH  --name $name --model pix2pix --netG unet_256 --direction BtoA --lambda_L1 100 --dataset_mode open4D --norm batch --pool_size 0 --max_dataset 100000 --batch_size 1
python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH  --name ${name} --model pix2pix --netG dcgan --lambda_L1 100 \
--dataset_mode open4D --norm batch --pool_size 0 --max_dataset 100000 --batch_size 1 --vgg_loss True \
--ngf 128

