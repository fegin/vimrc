git submodule update --init
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd -
cd ~/.vim/bundle/vimproc.vim
make
cd -

# brew install cmake
# sudo apt-get isntall build-essential cmake python-dev
