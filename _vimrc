"タブ
set tabstop=4
set softtabstop=0
set shiftwidth=4

"オートインデント
set autoindent
"行番号表示
set number
" 小文字のみで検索したときに大文字小文字を無視
set smartcase
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

"カラースキーマ
colorscheme molokai

"文字コード
"set fileencodings=cp932

"フォント
"set guifont=Ricty

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
    \     'mac' : 'make -Bf make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

" ソースコードを素早く実行
NeoBundle 'thinca/vim-quickrun'
" テンプレート
NeoBundle 'mattn/sonictemplate-vim'
" 入力補完
NeoBundle 'Shougo/neocomplcache'
" スニペット補完
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Python
NeoBundle 'davidhalter/jedi-vim'
" Vim shell
NeoBundle 'Shougo/vimshell.vim'
" Unite
NeoBundle 'Shougo/unite.vim'
" Unite.vim で最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" コメントを複数行簡単に入れられる
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定(別になくてもよい)
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

"---------------------------
" Start quickrun Settings.
"---------------------------
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"---------------------------
" End quickrun Settings.
"---------------------------

" Clipboadを標準入力として実行する
map <F6> :call TestIt() <CR>
function TestIt()
let l:test = substitute(@+, "'", "", "g")
let l:file = @%
write
let l:output = system("g++ -std=c++11 -Wall -Wextra -O2 -pedantic -Wfloat-equal -Wconversion -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=undefined '".file."' -g && (ulimit -c unlimited; echo '".test."' | ./a.out)")
echo l:output
endfunction

"---------------------------
" Start neocomplcache Settings.
"---------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"---------------------------
" End neocomplcache Settings.
"---------------------------

"---------------------------
" Start neosnippet Settings.
"---------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" my snippetファイルの場所を定義
let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory = s:my_snippet
"---------------------------
" Start neosnippet Settings.
"---------------------------

"Quick <ESC>
imap <C-j> <ESC>

"---------------------------
" Start VimShell Settings.
"---------------------------
" ,rs: run shell シェルを起動
nnoremap <silent> ,rs :VimShell<CR>
" ,rpy: run python pythonを非同期で起動
nnoremap <silent> ,rpy : VimShellInteractive python<CR>
" ,ss: send string 非同期で開いたインタプリタに現在の行を評価させる
vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
nnoremap <silent> ,ss <S-V>:VimShellSendString<CR>

"---------------------------
" End VimShell Settings.
"---------------------------

"---------------------------
" Start unite Settings.
"---------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウインドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウインドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを２回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"---------------------------
" End unite Settings.
"---------------------------
