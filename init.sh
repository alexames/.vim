#!/bin/bash

# Just in case I forgot to initialize submodules.
git submodule update --init --recursive

# Ensure that the plugins are all installed before we do anything else.
vim +PluginInstall +qall

# YCM needs to compile some stuff for it to work.
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
 
