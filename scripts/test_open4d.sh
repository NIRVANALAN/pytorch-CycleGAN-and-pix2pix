set -ex
name='open4d_pix2pix_vgg'
python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name ${name} --model pix2pix --netG unet_256 --direction BtoA --dataset_mode open4D --norm batch
# python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/GANGNAM --name open4d_pix2pix_center5 --model pix2pix --netG unet_256 --direction BtoA --dataset_mode open4D --norm batch
