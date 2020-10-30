"""Dataset class template

This module provides a template for users to implement custom datasets.
You can specify '--dataset_mode template' to use this dataset.
The class name should be consistent with both the filename and its dataset_mode option.
The filename should be <dataset_mode>_dataset.py
The class name should be <Dataset_mode>Dataset.py
You need to implement the following functions:
    -- <modify_commandline_options>:　Add dataset-specific options and rewrite default values for existing options.
    -- <__init__>: Initialize this dataset class.
    -- <__getitem__>: Return a data point and its metadata information.
    -- <__len__>: Return the number of images.
"""
import pdb
from sys import setrecursionlimit

from PIL.Image import NONE
from data.base_dataset import BaseDataset, get_transform
import torch
import torch.nn as nn
import math
from pathlib import Path
from PIL import Image
from .poses.pose_utils import load_colmap_pose

# from data.image_folder import make_dataset


def default_loader(path):
    return Image.open(path).convert("RGB")


class Open4DPoseDataset(BaseDataset):
    """A template dataset class for you to implement custom datasets."""

    @staticmethod
    def modify_commandline_options(parser, is_train):
        """Add new dataset-specific options, and rewrite default values for existing options.

        Parameters:
            parser          -- original option parser
            is_train (bool) -- whether training phase or test phase. You can use this flag to add training-specific or test-specific options.

        Returns:
            the modified parser.
        """
        parser.add_argument(
            "--new_dataset_option", type=float, default=1.0, help="new dataset option"
        )
        # specify dataset-specific default values
        parser.set_defaults(max_dataset_size=10, new_dataset_option=2.0)
        return parser

    def __init__(self, opt):
        """Initialize this dataset class.

        Parameters:
            opt (Option class) -- stores all the experiment flags; needs to be a subclass of BaseOptions

        A few things can be done here.
        - save the options (have been done in BaseDataset)
        - get image paths and meta information of the dataset.
        - define the image transformation.
        """
        # save the option and dataset root
        BaseDataset.__init__(self, opt)
        # img_root = Path(self.root) / "GT
        img_root = Path(self.root) / "stereo"
        sync_file = Path(self.root) / "Syncs" / "cam_sync.txt"
        # get the synced image pairs
        # get the image paths of your dataset;
        # You can call sorted(make_dataset(self.root, opt.max_dataset_size)) to get all the image paths under the directory self.root
        self.stereo_list = []

        for stereo_pair in img_root.iterdir():
            # self.stereo_list.append(load_colmap_pose(stereo_pair))
            self.stereo_list.append(stereo_pair)

        # define the default transform function. You can use <base_dataset.get_transform>; You can also define your custom transform function
        self.transform = get_transform(opt)

    def __getitem__(self, index):
        """Return a data point and its metadata information.

        Parameters:
            index -- a random integer for data indexing

        Returns:
            a dictionary of data with their names. It usually contains the data itself and its metadata information.

        Step 1: get a random image path: e.g., path = self.image_paths[index]
        Step 2: load your data from the disk: e.g., image = Image.open(path).convert('RGB').
        Step 3: convert your data to a PyTorch tensor. You can use helpder functions such as self.transform. e.g., data = self.transform(image)
        Step 4: return a data point as a dictionary.
        """
        multi_view = load_colmap_pose(self.stereo_list[index])  # needs to be a string
        img_list = []
        poses_list = []
        for img, pose in multi_view:
            img_tensor = default_loader(img)
            if self.transform is not None:
                img_tensor = self.transform(img_tensor)
            img_list.append(img_tensor)
            poses_list.append(torch.Tensor(pose))
        img_list, poses_list = [
            torch.stack(tensor_list, dim=0) for tensor_list in (img_list, poses_list)
        ]
        return {"frame": index, "gt": img_list, "poses": poses_list}

    def __len__(self):
        """Return the total number of images."""
        return len(self.stereo_list)
