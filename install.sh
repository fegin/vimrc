echo "let g:evervim_devtoken=''" > vimrc_private
git submodule update --init
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd -

# brew install cmake
# sudo apt-get isntall build-essential cmake python-dev
