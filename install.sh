#!/bin/bash

git clone https://github.com/riviox/dotfiles.git
cd dotfiles/dotfiles
cp -r * ~/.config
echo Installed!
