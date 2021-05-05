#!/bin/bash

# Just in case I forgot to initialize submodules.
git submodule update --init --recursive

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
 
