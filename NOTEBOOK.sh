#!/bin/bash
srun -p NTU --mpi=pmi2 --gres=gpu:$1 -n1 --ntasks-per-node=1 --job-name=jupyter --kill-on-bad-exit=1 -w SG-IDC1-10-51-1-45 \
bash scripts/train_open4d.sh
# python train.py --dataroot ./datasets/facades --name facades_pix2pix --model pix2pix --direction BtoA
