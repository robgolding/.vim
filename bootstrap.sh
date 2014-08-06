#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd);

git submodule update --init --recursive

if [ ! -e ~/.vim ]; then
    ln -s $SCRIPT_PATH ~/.vim
elif [ -L ~/.vim ]; then
    rm ~/.vim
    ln -s $SCRIPT_PATH ~/.vim
else
    echo "Error: File exists and is not a symlink: ~/.vim"
fi

for file in vimrc gvimrc; do
    if [ ! -e ~/.$file ]; then
        ln -s $SCRIPT_PATH/$file ~/.$file
    elif [ -L ~/.$file ]; then
        echo "Replacing symlink: ~/.$file"
        rm ~/.$file
        ln -s $SCRIPT_PATH/$file ~/.$file
    else
        echo "Error: File exists and is not a symlink: ~/.$file"
    fi
done
