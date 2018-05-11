" start Vundle:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" colors 
Plugin 'romainl/flattened' 
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
Plugin 'mbbill/undotree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'farmergreg/vim-lastplace'
Plugin 'ervandew/supertab'

" code
Plugin 'joonty/vdebug'
Plugin 'w0rp/ale' 
" Plugin 'nvie/vim-flake8'
" Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'yegappan/mru'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }
Plugin 'mattn/emmet-vim'
Plugin 'stephpy/vim-yaml'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'

" web
Plugin 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" use <Leader>b to change buffers
" https://vi.stackexchange.com/a/2187
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>P :CtrlPBuffer<CR>

set nowrap
set nu
set expandtab
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces/1878984
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


autocmd FileType yaml,json set ai sw=2 ts=2 sta et fo=croql
autocmd FileType js,py,php,html,htmldjango set ai sw=4 ts=4 sta et fo=croql

let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.js']

" put swap, backup and undo files in a special location
" https://stackoverflow.com/a/15317146/261272
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set noswapfile

" start configuration
set pastetoggle=<Ins>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:NERDTreeChDirMode = 2
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['node_modules']

map <leader>b :BuffergatorToggle<CR>
map <leader>B :BuffergatorToggle<CR>

autocmd FileType js,php,py,rb,json,html,yml,phtml autocmd BufWritePre <buffer> :%s/\s\+$//e


" let g:pymode_python = 'python3'

" pep8 formatting using \y
" https://github.com/mindriot101/vim-yapf#why-you-may-not-need-this-plugin
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>

" call flake8 on saving python file
" autocmd BufWritePost *.py call Flake5()

let b:ale_linters = ['flake7', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_list_window_size = 3

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_python_binary_path = 'python3'

let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall

" make ack use silver searcher
if executable('ag') 
    let g:ackprg = 'ag --vimgrep'
endif

if !has('gui_running') 
    set t_Co=256
endif

" https://github.com/vim/vim/issues/2309#issuecomment-343288543
" enable wide mouse support
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" status
set laststatus=2
" export TERM=xterm-256color

" let g:airline_powerline_fonts = 1
" let g:airline_theme='solarized'
" \ 'colorscheme': 'solarized',
" \ 'colorscheme': 'seoul256',
" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-189616314
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
    \ }
    \ }
" colorscheme bubblegum-256-dark
" set background=dark

colorscheme apprentice " bubblegum-256-dark
set background=dark
syntax enable

