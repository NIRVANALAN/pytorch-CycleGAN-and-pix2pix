+ name=nvs_1_serial_inversepose
+ python train.py --dataroot /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH --name nvs_1_serial_inversepose --model nvs --netG dcgan --lambda_L1 100 --dataset_mode open4D_pose --norm batch --pool_size 0 --max_dataset 100000 --batch_size 1 --input_nc 128 --num_threads 4 --n_epochs 400
Setting up a new session...
----------------- Options ---------------
               batch_size: 1                             
                    beta1: 0.5                           
          checkpoints_dir: ./checkpoints                 
           continue_train: False                         
                crop_size: 256                           
                 dataroot: /mnt/lustre/yslan/Dataset/OPen4D/JUMPING-MINH	[default: None]
             dataset_mode: open4D_pose                   	[default: aligned]
                direction: AtoB                          
              display_env: main                          
             display_freq: 400                           
               display_id: 1                             
            display_ncols: 4                             
             display_port: 8097                          
           display_server: http://localhost              
          display_winsize: 256                           
                    epoch: latest                        
              epoch_count: 1                             
                 gan_mode: vanilla                       
                  gpu_ids: 0                             
                init_gain: 0.02                          
                init_type: normal                        
                 input_nc: 128                           	[default: 3]
                  isTrain: True                          	[default: None]
                lambda_L1: 100.0                         
               lambda_vgg: 10.0                          
                load_iter: 0                             	[default: 0]
                load_size: 286                           
                       lr: 0.0002                        
           lr_decay_iters: 50                            
                lr_policy: linear                        
         max_dataset_size: 100000                        	[default: 10]
                    model: nvs                           	[default: cycle_gan]
                 n_epochs: 400                           	[default: 100]
           n_epochs_decay: 100                           
               n_layers_D: 3                             
                     name: nvs_1_serial_inversepose      	[default: experiment_name]
                      ndf: 64                            
                     netD: basic                         
                     netG: dcgan                         
       new_dataset_option: 2.0                           
                      ngf: 64                            
               no_dropout: False                         
                  no_flip: False                         
                  no_html: False                         
                     norm: batch                         
              num_threads: 4                             
                output_nc: 3                             
                    phase: train                         
                pool_size: 0                             
               preprocess: resize_and_crop               
               print_freq: 100                           
             save_by_iter: False                         
          save_epoch_freq: 5                             
         save_latest_freq: 5000                          
           serial_batches: False                         
                   suffix:                               
         update_html_freq: 1000                          
                  verbose: False                         
                 vgg_loss: False                         
----------------- End -------------------
dataset [Open4DPoseDataset] was created
The number of training samples = 522
initialize network with normal
initialize network with normal
model [NVSModel] was created
---------- Networks initialized -------------
[Network G] Total number of parameters : 48.903 M
[Network D] Total number of parameters : 2.766 M
-----------------------------------------------
create web directory ./checkpoints/nvs_1_serial_inversepose/web...
learning rate 0.0002000 -> 0.0002000
/mnt/lustre/yslan/local/anaconda3/lib/python3.8/site-packages/torch/optim/lr_scheduler.py:118: UserWarning: Detected call of `lr_scheduler.step()` before `optimizer.step()`. In PyTorch 1.1.0 and later, you should call them in the opposite order: `optimizer.step()` before `lr_scheduler.step()`.  Failure to do this will result in PyTorch skipping the first value of the learning rate schedule. See more details at https://pytorch.org/docs/stable/optim.html#how-to-adjust-learning-rate
  warnings.warn("Detected call of `lr_scheduler.step()` before `optimizer.step()`. "
(epoch: 1, iters: 100, time: 0.103, data: 0.641) G_GAN: 1.166 G_L1: 40.355 D_real: 0.465 D_fake: 0.438 
(epoch: 1, iters: 200, time: 0.114, data: 0.001) G_GAN: 1.709 G_L1: 42.086 D_real: 0.430 D_fake: 0.488 
(epoch: 1, iters: 300, time: 0.110, data: 0.009) G_GAN: 1.572 G_L1: 40.546 D_real: 0.312 D_fake: 0.090 
(epoch: 1, iters: 400, time: 0.334, data: 0.003) G_GAN: 2.945 G_L1: 40.882 D_real: 0.113 D_fake: 0.085 
(epoch: 1, iters: 500, time: 0.109, data: 0.003) G_GAN: 1.550 G_L1: 42.472 D_real: 0.276 D_fake: 0.048 
End of epoch 1 / 500 	 Time Taken: 69 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 2, iters: 78, time: 0.070, data: 0.003) G_GAN: 1.461 G_L1: 44.868 D_real: 0.135 D_fake: 0.097 
(epoch: 2, iters: 178, time: 0.117, data: 0.178) G_GAN: 4.091 G_L1: 44.220 D_real: 0.064 D_fake: 1.134 
(epoch: 2, iters: 278, time: 0.262, data: 0.066) G_GAN: 3.425 G_L1: 45.497 D_real: 0.044 D_fake: 0.537 
(epoch: 2, iters: 378, time: 0.070, data: 0.015) G_GAN: 1.056 G_L1: 44.859 D_real: 0.598 D_fake: 0.130 
(epoch: 2, iters: 478, time: 0.071, data: 0.122) G_GAN: 1.264 G_L1: 42.398 D_real: 0.193 D_fake: 0.361 
End of epoch 2 / 500 	 Time Taken: 65 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 3, iters: 56, time: 0.077, data: 0.171) G_GAN: 1.748 G_L1: 42.180 D_real: 0.216 D_fake: 0.196 
(epoch: 3, iters: 156, time: 0.418, data: 0.222) G_GAN: 3.288 G_L1: 45.110 D_real: 0.151 D_fake: 0.063 
(epoch: 3, iters: 256, time: 0.070, data: 0.063) G_GAN: 1.481 G_L1: 42.626 D_real: 0.750 D_fake: 0.107 
(epoch: 3, iters: 356, time: 0.071, data: 0.001) G_GAN: 3.022 G_L1: 48.244 D_real: 0.010 D_fake: 0.713 
(epoch: 3, iters: 456, time: 0.072, data: 0.001) G_GAN: 0.848 G_L1: 44.855 D_real: 0.489 D_fake: 0.170 
End of epoch 3 / 500 	 Time Taken: 67 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 4, iters: 34, time: 0.542, data: 0.001) G_GAN: 2.056 G_L1: 47.749 D_real: 0.046 D_fake: 0.165 
(epoch: 4, iters: 134, time: 0.081, data: 0.003) G_GAN: 1.366 G_L1: 45.368 D_real: 0.460 D_fake: 0.192 
(epoch: 4, iters: 234, time: 0.070, data: 0.002) G_GAN: 2.743 G_L1: 41.777 D_real: 0.025 D_fake: 1.366 
(epoch: 4, iters: 334, time: 0.109, data: 0.001) G_GAN: 3.481 G_L1: 44.188 D_real: 0.053 D_fake: 1.040 
(epoch: 4, iters: 434, time: 0.283, data: 0.001) G_GAN: 1.953 G_L1: 47.625 D_real: 0.342 D_fake: 0.121 
End of epoch 4 / 500 	 Time Taken: 65 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 5, iters: 12, time: 0.116, data: 0.001) G_GAN: 1.945 G_L1: 45.599 D_real: 0.176 D_fake: 0.215 
(epoch: 5, iters: 112, time: 0.070, data: 0.127) G_GAN: 1.668 G_L1: 46.248 D_real: 0.557 D_fake: 0.151 
(epoch: 5, iters: 212, time: 0.070, data: 0.001) G_GAN: 2.369 G_L1: 48.132 D_real: 0.061 D_fake: 0.374 
(epoch: 5, iters: 312, time: 0.471, data: 0.001) G_GAN: 2.374 G_L1: 46.908 D_real: 0.217 D_fake: 0.211 
(epoch: 5, iters: 412, time: 0.070, data: 0.003) G_GAN: 1.697 G_L1: 44.475 D_real: 0.155 D_fake: 0.258 
(epoch: 5, iters: 512, time: 0.112, data: 0.001) G_GAN: 1.815 G_L1: 42.797 D_real: 0.382 D_fake: 0.149 
saving the model at the end of epoch 5, iters 2610
End of epoch 5 / 500 	 Time Taken: 66 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 6, iters: 90, time: 0.073, data: 0.001) G_GAN: 2.328 G_L1: 40.688 D_real: 0.385 D_fake: 0.064 
(epoch: 6, iters: 190, time: 0.222, data: 0.001) G_GAN: 0.762 G_L1: 46.183 D_real: 0.981 D_fake: 0.102 
(epoch: 6, iters: 290, time: 0.091, data: 0.001) G_GAN: 2.323 G_L1: 44.724 D_real: 0.038 D_fake: 0.300 
(epoch: 6, iters: 390, time: 0.117, data: 0.005) G_GAN: 0.994 G_L1: 42.003 D_real: 0.477 D_fake: 0.122 
(epoch: 6, iters: 490, time: 0.118, data: 0.166) G_GAN: 2.624 G_L1: 45.363 D_real: 0.208 D_fake: 0.380 
End of epoch 6 / 500 	 Time Taken: 64 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 7, iters: 68, time: 0.373, data: 0.001) G_GAN: 0.948 G_L1: 44.795 D_real: 0.452 D_fake: 0.163 
(epoch: 7, iters: 168, time: 0.113, data: 0.009) G_GAN: 2.204 G_L1: 40.151 D_real: 0.130 D_fake: 0.420 
(epoch: 7, iters: 268, time: 0.134, data: 0.033) G_GAN: 2.163 G_L1: 46.706 D_real: 0.071 D_fake: 0.283 
(epoch: 7, iters: 368, time: 0.101, data: 0.002) G_GAN: 2.280 G_L1: 43.085 D_real: 0.316 D_fake: 0.216 
(epoch: 7, iters: 468, time: 0.212, data: 0.001) G_GAN: 1.761 G_L1: 41.330 D_real: 0.470 D_fake: 0.094 
End of epoch 7 / 500 	 Time Taken: 66 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 8, iters: 46, time: 0.080, data: 0.002) G_GAN: 3.079 G_L1: 43.261 D_real: 0.251 D_fake: 0.097 
(epoch: 8, iters: 146, time: 0.096, data: 0.003) G_GAN: 2.043 G_L1: 40.418 D_real: 0.184 D_fake: 0.239 
(epoch: 8, iters: 246, time: 0.111, data: 0.071) G_GAN: 1.619 G_L1: 40.645 D_real: 0.529 D_fake: 0.050 
(epoch: 8, iters: 346, time: 0.327, data: 0.218) G_GAN: 2.161 G_L1: 44.768 D_real: 0.089 D_fake: 0.651 
(epoch: 8, iters: 446, time: 0.274, data: 0.012) G_GAN: 2.621 G_L1: 43.429 D_real: 0.235 D_fake: 0.064 
End of epoch 8 / 500 	 Time Taken: 71 sec
learning rate 0.0002000 -> 0.0002000
(epoch: 9, iters: 24, time: 0.267, data: 0.003) G_GAN: 2.974 G_L1: 44.951 D_real: 1.624 D_fake: 3.723 
(epoch: 9, iters: 124, time: 0.074, data: 0.036) G_GAN: 1.755 G_L1: 40.838 D_real: 0.116 D_fake: 0.259 
(epoch: 9, iters: 224, time: 0.227, data: 0.001) G_GAN: 2.185 G_L1: 48.462 D_real: 0.326 D_fake: 0.240 
(epoch: 9, iters: 324, time: 0.076, data: 0.003) G_GAN: 2.072 G_L1: 46.883 D_real: 0.148 D_fake: 0.181 
(epoch: 9, iters: 424, time: 0.070, data: 0.001) G_GAN: 2.703 G_L1: 47.173 D_real: 0.111 D_fake: 0.272 
End of epoch 9 / 500 	 Time Taken: 70 sec
learning rate 0.0002000 -> 0.0002000
