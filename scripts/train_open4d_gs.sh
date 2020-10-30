set -ex
name='open4d_pix2pix_GS_vgg_01'
python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/GANGNAM  --name ${name} --model pix2pix --netG unet_256 --direction BtoA --lambda_L1 100 --dataset_mode open4D --norm batch --pool_size 0 --max_dataset 100000 --batch_size 4 --vgg_loss True
python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/GANGNAM --name ${name} --model pix2pix --netG unet_256 --direction BtoA --dataset_mode open4D --norm batch
