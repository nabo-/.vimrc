set nocompatible
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif


if has('mac')
        let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
endif

call neobundle#begin(expand('~/.vim/bundle/'))


NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle プラグイン

NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/unite-outline.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/neosnippet.vim'
NeoBundle 'https://github.com/Shougo/neosnippet-snippets.git'
NeoBundle 'https://github.com/Shougo/neocomplete.vim'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/pangloss/vim-javascript.git'


NeoBundle 'https://github.com/tpope/vim-fugitive'
NeoBundle 'https://github.com/othree/html5.vim.git'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'https://github.com/mustache/vim-mustache-handlebars.git'
NeoBundle 'https://github.com/cakebaker/scss-syntax.vim.git'
NeoBundle 'https://github.com/othree/javascript-libraries-syntax.vim.git'
NeoBundle 'https://github.com/mxw/vim-jsx.git'

NeoBundle 'tpope/vim-surround'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'https://github.com/tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'https://github.com/itchyny/lightline.vim.git'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/jistr/vim-nerdtree-tabs.git'
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on

syntax on

set ruler
set title
set mouse=a
set number
set clipboard=unnamed
set encoding=UTF-8
set gfn=SourceCodePro\h13
set guifontwide=ヒラギノ角ゴ\ StdN\ W8:h13


imap <C-j> <esc>



"------------------------------------
" emmet-vim
"------------------------------------
let g:user_emmet_leader_key='<c-y>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': ' '
    \ }




"------------------------------------
" unite.vim
"------------------------------------
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始

let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数

let g:unite_source_file_mru_limit = 20

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
noremap <C-U> :Unite -buffer-name=file file<CR>
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"バッファ一覧
noremap <C-B> :Unite buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>

"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>

"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{

  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)

  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)

  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')

endfunction"}}}




"------------------------------------
"vimfiler
"------------------------------------
let g:vimfiler_as_default_explorer = 1



"------------------------------------
"css color
"------------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1



"------------------------------------
"markdown
"------------------------------------
autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
autocmd BufRead,BufNewFile *.md  setfiletype mkd

autocmd BufNewFile,BufRead *.css,*.less set filetype=css



"------------------------------------
" nerdtree setting
"------------------------------------

"nnoremap <silent><C-e> :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
let g:NERDTreeShowHidden = 1



"------------------------------------
" js lib syntax
"------------------------------------
let g:used_javascript_libs = 'underscore, backbone, angularjs, requirejs, jquery, react'


"------------------------------------
" sass
"------------------------------------
au! BufRead,BufNewFile *.sass         setfiletype sass


"------------------------------------
" mustache
"------------------------------------
let g:mustache_abbreviations = 1



"------------------------------------
" ime
"------------------------------------

set iminsert=0
set imsearch=0

set modifiable
set write

set noexpandtab

set showcmd
set cmdheight=1

set showmatch


"------------------------------------
" molokai setting
"------------------------------------
colorscheme molokai
let g:molokai_original = 1


"------------------------------------
" lightline setting
"------------------------------------

set laststatus=2

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode'
        \ }
        \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction






"------------------------------------
"neocomplete setting
"------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'




cd $HOME
