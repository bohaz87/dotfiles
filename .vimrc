" Automatic installation vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nu
set rnu
set encoding=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2


call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

