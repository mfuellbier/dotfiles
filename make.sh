#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc conkyrc tmux.conf vimperatorrc vimrc xinitrc zshrc config/openbox/rc.xml config/awesome/rc.lua "    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ ! -L ~/.$file ]; then
        # if ~/.$file is not a symbolic link
        echo "Moving any existing dotfiles from ~ to $olddir"
        if [[ `echo $file | grep /` != '' ]]; then
            # if $file is in subdirectory (as config/awesome/rc.lua)
            mkdir -p $olddir/`echo $file | grep -oe "^.*/" | rev | cut -b 2- | rev`
        fi
        mv ~/.$file $olddir/$file
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    else
        echo "-/.$file is symlink. Continue with next file..."
    fi
done
