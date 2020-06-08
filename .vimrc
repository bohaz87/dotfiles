" ============================================
" view
" ============================================
set nu
set rnu
set showcmd
set nowrap
colors elflord
syntax on
filetype plugin indent on

" ============================================
" editing
" ============================================
set mouse=a
set encoding=utf-8
set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces
set eol

" ============================================
" backup
" ============================================
set nobackup
set nowritebackup
set noswapfile

" ============================================
" Plugin
" ============================================
" Automatic installation vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'yuezk/vim-js', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'sickill/vim-monokai'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" ============================================
" Plugin - CtrlP config
" ============================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|.*_build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

