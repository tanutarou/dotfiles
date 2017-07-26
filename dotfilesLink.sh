#! /bin/bash
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_latexmkrc ~/.latexmkrc

# NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# colorscheme
mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai
mv ./molokai/colors/molokai.vim ~/.vim/colors
rm -rf ./molokai

# sonic-template
ln -s ./vim/sonictemplate-vim/base-comp.cpp ~/.vim/bundle/sonictemplate-vim/template/cpp/base-comp.cpp

# neosnippet
ln -s ./vim/neosnippet/cpp.snip ~/.vim/bundle/neosnippet-snippets/neosnippets/cpp.snip
