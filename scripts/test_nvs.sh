
set -ex
name='nvs_1_serial_inverse'

#test
python test.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name ${name} --model nvs --netG dcgan --dataset_mode open4D_pose --norm batch \
--input_nc 128 --test_sample_id 44 --max_dataset_size 10
