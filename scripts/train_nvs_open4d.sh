set -ex name='nvs_1_shuffle_inverse'
# python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH  --name $name --model pix2pix --netG unet_256 --direction BtoA --lambda_L1 100 --dataset_mode open4D --norm batch --pool_size 0 --max_dataset 100000 --batch_size 1
python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH  --name ${name} --model nvs --netG dcgan \
--lambda_L1 100 --dataset_mode open4D_pose --norm batch --pool_size 0 --max_dataset 100000 --batch_size 1 \
--input_nc 128 --num_threads 4 --n_epochs 100 --vgg_loss False # --serial_batches 

#test
python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name ${name} --model nvs --netG dcgan --dataset_mode open4D_pose --norm batch \
--input_nc 128
