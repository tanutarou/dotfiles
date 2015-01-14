"タブ
set tabstop=4
set softtabstop=0
set shiftwidth=4

"オートインデント
set autoindent
"行番号表示
set number

"カラースキーマ
colorscheme molokai

"文字コード
set fileencodings=cp932

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリの指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" プラグインたち
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc' 
" ソースコードを素早く実行
NeoBundle 'thinca/vim-quickrun'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定(別になくてもよい)
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------
