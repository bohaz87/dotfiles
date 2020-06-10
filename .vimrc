" ============================================
" view
" ============================================
set nu
set rnu
set showcmd
set nowrap
set hlsearch
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
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|.*_build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'sickill/vim-monokai'

" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let g:coc_global_extensions = [
"  \ 'coc-tsserver'
"  \ ]
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"  let g:coc_global_extensions += ['coc-prettier']
"endif
"
"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"  let g:coc_global_extensions += ['coc-eslint']
"endif
"nnoremap <silent> K :call CocAction('doHover')<CR>
"
"function! ShowDocIfNoDiagnostic(timer_id)
"  if (coc#util#has_float() == 0)
"    silent call CocActionAsync('doHover')
"  endif
"endfunction
"
"function! s:show_hover_doc()
"  call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
