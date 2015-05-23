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
"set fileencodings=cp932

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリの指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" プラグインたち
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

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

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
