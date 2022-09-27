#!/bin/bash
#
# Currently on Fedora, but I'm known to use Debian-relatives as well, so...
PKG_MGR="dnf"
REPO_DIR=$(pwd)

# Install RC
pushd ~
ln -s ${REPO_DIR}/.vimrc .vimrc
popd

# Get and setup Vundle + Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install dependencies needed for YVM
sudo $PKG_MGR install cmake python-devel clang

# Compile YCM
pushd ~/.vim/bundle/YouCompleteMe/
./install.py
popd
