#!/bin/bash

# Installs the prefered environment

# Install proper version of vim
sudo apt-get remove vim-tny
sudo apt-get update
sudo apt-get install vim

# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Link vimrc file
ln -s $(pwd)/vimrc ~/.vimrc

# Install vundle
vim +PluginInstall +qall
