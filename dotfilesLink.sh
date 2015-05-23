#! /bin/bash
ln -s ~/dotfiles/_vimrc ~/.vimrc

# NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# colorscheme
mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai
mv ./molokai/colors/molokai.vim ~/.vim/colors
rm -rf ./molokai

