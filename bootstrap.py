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
            for current_dir, sub_dirs, files in os.walk(os.path.join(src, entry)):
                for file_name in files:
                    os.symlink(os.path.join(src, entry, file_name), os.path.join(dest, '.' + file_name))
                for sub_dir_name in sub_dirs:
                    os.symlink(os.path.join(src, entry, sub_dir_name), os.path.join(dest, '.' + sub_dir_name), True)




