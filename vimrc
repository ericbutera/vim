" start Vundle:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'kkoenig/wimproved.vim'

"" test angular js stuff 
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
"" end angular

" colors 
Plugin 'romainl/flattened' 
Plugin 'romainl/Apprentice'
Plugin 'baskerville/bubblegum'

" bars n stuff
Plugin 'itchyny/lightline.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" various plugins
Plugin 'tpope/vim-sleuth'
Plugin 'qpkorr/vim-bufkill'
Plugin 'junegunn/vim-easy-align'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-sensible'
" Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'mbbill/undotree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'farmergreg/vim-lastplace'
Plugin 'ervandew/supertab'

" code
" Plugin 'ambv/black'
Plugin 'prettier/vim-prettier'
" Plugin 'joonty/vdebug'
Plugin 'w0rp/ale' 
" Plugin 'nvie/vim-flake8'
" Plugin 'python-mode/python-mode'
" Plugin 'davidhalter/jedi-vim'
Plugin 'yegappan/mru'
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'Valloric/YouCompleteMe' " , { 'do': './install.sh --clang-completer --omnisharp-completer' }
Plugin 'mattn/emmet-vim'
Plugin 'stephpy/vim-yaml'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'ap/vim-css-color'
Plugin 'majutsushi/tagbar'
Plugin 'hushicai/tagbar-javascript.vim'

Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
filetype on

" use <Leader>b to change buffers
" https://vi.stackexchange.com/a/2187
map <Leader>D :BD<cr>
nnoremap <Leader>B :ls<CR>:b<Space>
" nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>P :CtrlPBuffer<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

set nowrap
set nu
set expandtab
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces/1878984
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


autocmd FileType yaml,json set ai sw=2 ts=2 sta et fo=croql
autocmd FileType js,html set ai sw=4 ts=4 sta et fo=croql fileformat=dos
autocmd BufNewFile,BufRead *.cshtml set syntax=html
" au BufReadPost *.cshtml set syntax=html

augroup filetypedetect
    au BufRead,BufNewFile *.cshtml set filetype=html fileformat=dos
augroup END

let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<Leader>D"
let g:jedi#usages_command = "<leader>N"
" let g:jedi#autocompletion_command = "<C-Space>"

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

" map <leader>b :BuffergatorToggle<CR>
" map <F7> :BuffergatorToggle<CR>

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

nmap <F8> :TagbarToggle<CR>

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>


let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules',
  \ }


" search
" set incsearch
set hlsearch
set ignorecase " https://stackoverflow.com/a/2287449/261272
set smartcase 
nnoremap <silent> <leader>l :nohl<CR><C-l>

if !has('gui_running') 
    set t_Co=256
endif

if has('gui_running')
    " set guioptions-=M
    set guifont=Hack:h14
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

    " https://stackoverflow.com/a/5917179/261272
    setglobal guioptions-=l
    setglobal guioptions-=R
    setglobal guioptions-=b
    setglobal guioptions-=h
    setglobal guioptions-=e

    autocmd GUIEnter * silent! WToggleClean
endif

" https://github.com/vim/vim/issues/2309#issuecomment-343288543
" enable wide mouse support
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" let g:airline_powerline_fonts = 1
" let g:airline_theme='solarized'
"
" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-189616314
    " \ 'colorscheme': 'wombat',
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
    \ }
    \ }


if has('gui_running')
    colorscheme flattened_light
    set background=light
else
    colorscheme apprentice
    set background=dark
end

"colorscheme apprentice " bubblegum-256-dark
"set background=dark
syntax enable

"macvim disable bell
" set novisualbell
set noerrorbells 
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" horizontal/vertical line highlight
set cursorcolumn
set cursorline

" run this to reset geometry to max; nothin but problems on windows
set lines=50 columns=1000


" set breakindent
" set breakindentopt=sbr
" I use a unicode curly array with a <backslash><space>
" set showbreak=↪>\
