" start Vundle:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" colors 
Plugin 'romainl/Apprentice'
Plugin 'baskerville/bubblegum'
Plugin 'romainl/flattened'
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" my plugins
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'sjl/gundo.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mileszs/ack.vim',     { 'on': 'Ack'            }
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" code
Plugin 'joonty/vdebug'
Plugin 'python-mode/python-mode'
Plugin 'yegappan/mru'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }

" web
Plugin 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

let g:gutentags_cache_dir = '~/.vim/gutentags'

" start configuration
set pastetoggle=<Ins>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:NERDTreeChDirMode = 2
map <leader>n :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

map <leader>b :BuffergatorToggle<CR>
map <leader>B :BuffergatorToggle<CR>

autocmd FileType js,php,py,rb,json,html,yml,phtml autocmd BufWritePre <buffer> :%s/\s\+$//e

let g:airline_powerline_fonts = 1
set t_Co=256

colorscheme bubblegum-256-dark
set background=dark
syntax enable
let g:airline_theme='bubblegum'

