import torch
import torch.nn as nn
import torch.nn.utils.spectral_norm as spectral_norm

import sys
import datetime
import time


def print_now(cmd, file=None):
    time_now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    if file is None:
        print("%s %s" % (time_now, cmd))
    else:
        print_str = "%s %s" % (time_now, cmd)
        print(print_str, file=file)
    sys.stdout.flush()
