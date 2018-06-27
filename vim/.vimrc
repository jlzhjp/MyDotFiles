"The light weight vim
call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'wincent/terminus'
Plug 'jlzhjp/vim-pair',
Plug 'ervandew/supertab', { 'for': 'cpp' }

call plug#end()

syntax on
syntax enable

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
colorscheme onedark

set autoindent
set autoread
set autowrite
set autowriteall
set background=dark
set backup
set backspace=indent,eol,start
set cc=80
set cursorline
set copyindent
set completeopt=menu,preview
set encoding=utf-8
set expandtab
set foldenable
set foldmethod=marker
set guifont=Source\ Code\ Pro\ 11
set guioptions-=m
set guioptions-=T
set hlsearch
set hidden
set history=100
set incsearch
set lazyredraw
set mouse=a
set mousehide
set number
set noerrorbells
set nobackup
set nocompatible
set novisualbell
set relativenumber
set scrolloff=10
set smartcase
set showmatch
set shiftwidth=4
set softtabstop=4
set showmatch
set timeoutlen=1000
set ttimeoutlen=0
set title
set tm=500
set tabstop=4
set termguicolors
set undolevels=100
set wildmenu
set whichwrap=h,l,b,s,<,>,[,] 

augroup IndentSetting
    autocmd!
    autocmd FileType vim setlocal shiftwidth=2
                \|setlocal tabstop=2
                \|setlocal softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
                \|setlocal tabstop=2
                \|setlocal softtabstop=2
    autocmd FileType python setlocal shiftwidth=2
                \|setlocal tabstop=2
                \|setlocal softtabstop=2
augroup END

let mapleader = ';'
inoremap jk <Esc>

map <Space> <Plug>(easymotion-prefix)
map <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
map <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
map <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
map <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)
map . <Plug>(easymotion-repeat)

nnoremap <Left> <C-w><C-h>
nnoremap <Right> <C-w><C-l>
nnoremap <Up> <C-w><C-k>
nnoremap <Down> <C-w><C-j>
nnoremap <Leader><Tab> :bn<Cr>

