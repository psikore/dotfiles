#!/bin/bash
#############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#############################

# Variables {{{
dir=~/dotfiles
bupdir=~/dotfiles_bup
files="vimrc vim"           # list of files/folders to symlink in homedir
# }}}
# create dotfiles_old in homedir
echo "Creating $bupdir for backup of any existing dotfiles in home directory"
mkdir -p $bupdir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_bup directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $bupdir"
    mv ~/.$file ~/dotfiles_bup/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

