# Currently on Fedora, but I'm known to use Debian-relatives as well, so...
PKG_MGR="dnf"

# Install RC
cp .vimrc ~/.vimrc

# Get and setup Vundle + Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install CMAKE, python headers for YVM
sudo $PKG_MGR install cmake python-devel

# Compile YCM
pushd ~/.vim/bundle/YouCompleteMe/
./install.py
popd
