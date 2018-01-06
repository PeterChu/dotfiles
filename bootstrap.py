#! /usr/local/bin/python3

import os
import sys
import glob
from pathlib import Path

# Source is the current directory where the script resides
src = sys.path[0]
# print("source: " + src)

# Destination is the user's home directory
dest = str(Path.home())
# print("destination: " + dest)

# TODO: Add check for existing links and error handling

# Get list of files and directories from the source and proceed to symlink them to the destination 
for entry in os.listdir(src):
    if os.path.isfile(os.path.join(src, entry)):
        # Create symlinks for all files except the README file and the current bootstrap script
        if entry != 'README.md' and entry != os.path.basename(__file__):
            os.symlink(os.path.join(src, entry), os.path.join(dest, '.' + entry))
    else:
        # Go through all subdirectories except '.git'
        if entry != '.git':
            # Create symlinks for all files and subdirectories of the current sub directory
            for sub_entry in os.listdir(os.path.join(src, entry)):
                if os.path.isfile(os.path.join(src, entry, sub_entry)):
                    os.symlink(os.path.join(src, entry, sub_entry), os.path.join(dest, '.' + sub_entry))
                else:
                    os.symlink(os.path.join(src, entry, sub_entry), os.path.join(dest, '.' + sub_entry), True)



