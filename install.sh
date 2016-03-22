# Install RC
cp .vimrc ~/.vimrc

# Get and setup Vundle + Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
