set -ex
python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name open4d_pix2pix_vgg --model pix2pix --netG unet_256 --direction BtoA --dataset_mode open4D --norm batch --vgg_loss
# python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/GANGNAM --name open4d_pix2pix_center5 --model pix2pix --netG unet_256 --direction BtoA --dataset_mode open4D --norm batch
