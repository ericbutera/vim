" start Vundle:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" colors light
Plugin 'romainl/flattened' 
" colors dark
Plugin 'romainl/Apprentice'
Plugin 'baskerville/bubblegum'

" bars n stuff
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" various plugins
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'sjl/gundo.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'farmergreg/vim-lastplace'

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

" use <Leader>b to change buffers
" https://vi.stackexchange.com/a/2187
nnoremap <Leader>b :ls<CR>:b<Space>

set nowrap
set nu
set expandtab
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces/1878984
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


autocmd FileType html,htmldjango set ai sw=2 ts=2 sta et fo=croql

let g:gutentags_cache_dir = '~/.vim/gutentags'

" put swap, backup and undo files in a special location
" https://stackoverflow.com/a/15317146/261272
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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

if executable('ag') 
    let g:ackprg = 'ag --vimgrep'
endif

if !has('gui_running') 
    set t_Co=256
endif

" status
set laststatus=2
" export TERM=xterm-256color

" let g:airline_powerline_fonts = 1
" let g:airline_theme='solarized'
let g:lightline = { 
            \ 'colorscheme': 'solarized',
            \ }

" colorscheme bubblegum-256-dark
" set background=dark

colorscheme flattened_light
set background=light
syntax enable

