set -ex
python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name open4d_cyclegan_10 --model cycle_gan --pool_size 50 --no_dropout
