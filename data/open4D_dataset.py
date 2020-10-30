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
from torch.utils import data
from data.base_dataset import BaseDataset, get_transform
from pathlib import Path
from .image_folder import default_loader
# from data.image_folder import make_dataset
# from PIL import Image


class Open4DDataset(BaseDataset):
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
        parser.add_argument('--new_dataset_option', type=float,
                            default=1.0, help='new dataset option')
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
        img_root = Path(self.root) / 'GT'
        sync_file = Path(self.root) / 'Syncs' / 'cam_sync.txt'
        # get the synced image pairs
        # get the image paths of your dataset;
        # You can call sorted(make_dataset(self.root, opt.max_dataset_size)) to get all the image paths under the directory self.root
        self.image_paths = []
        self.order = [2, 4, 6, 5, 0, 3, 7, 1]
        self.nei_views = list(self.order)
        self.center = 5
        self.nei_views.remove(self.center)
        with open(sync_file, 'r') as cam_sync:
            # ? name here
            sync_pairs = cam_sync.readlines()[1:]
            for view_pair in sync_pairs:
                view_pair = view_pair.strip().split()[2:]
                # pair_paths = [img_root / str(view_pair[i]) / 'Corrected' / '{:0>4}_.png'.format(
                #     view_pair[i+1]) for i in range(0, len(view_pair), 2)]
                pair_paths = [img_root / str(view_pair[i]) / '{:0>4}.png'.format(
                    view_pair[i+1]) for i in range(0, len(view_pair), 2)]
                # for i in self.nei_views:
                #     pair = (
                #         pair_paths[self.center], pair_paths[self.order[(i) % len(self.order)]])
                pair = (pair_paths[0], pair_paths[1])  # 1 4
                if all(p.exists() for p in pair):
                    self.image_paths.append(tuple(map(str, pair)))
                # if all(p.exists() for p in pair_paths):
                #     self.image_paths.append(tuple(map(str, pair_paths)))
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
        path = self.image_paths[index]    # needs to be a string
        data_A = default_loader(path[0])    # needs to be a tensor
        data_B = default_loader(path[1])    # needs to be a tensor
        if self.transform is not None:
            data_A, data_B = map(self.transform, (data_A, data_B))
        return {'A': data_A, 'B': data_B, 'A_paths': str(path), 'B_paths': str(path)}

    def __len__(self):
        """Return the total number of images."""
        return len(self.image_paths)
