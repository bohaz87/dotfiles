" ============================================
" basic & view
" ============================================
set nocompatible
set background=dark
colors default
set nu
set rnu
set showcmd
set nowrap
set hlsearch
set ignorecase
set smartcase
syntax on
filetype plugin indent on

" ============================================
" editing
" ============================================
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
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
" Plug 'jparise/vim-graphql'

Plug 'sickill/vim-monokai'
Plug 'altercation/vim-colors-solarized'

"  https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Use K to show documentation in preview window.
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>


let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" gui settings
if has('gui_running')
  set background=light
  set linespace=1
  colors default
  set guifont=source_code_pro:h13
endif

" ============================================
" cunstom view
" 256 colors: http://guns.github.io/xterm-color-table.vim/images/xterm-color-table-with-visible-rgb.png
" ============================================
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
hi lineNr cterm=italic ctermfg=8
hi Comment cterm=italic ctermfg=8 gui=italic guifg=darkgray
