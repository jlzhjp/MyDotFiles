"--------------------------------------
"======================================
"============= Plugins ================
"======================================
"--------------------------------------
call plug#begin("~/.config/nvim/plugged")

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jlzhjp/vim-pair'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'pkosel/deoplete-omnisharp'

Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'Chiel92/vim-autoformat'

Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'

Plug 'OrangeT/vim-csharp'
Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'

call plug#end()

syntax on
syntax enable
colorscheme onedark

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"--------------------------------------
"======================================
"============== Settings ==============
"======================================
"--------------------------------------
set autoindent
set autoread
set autowrite
set autowriteall
set background=dark
set backup
set backupdir=~/.config/nvim/backup
set cc=80
set cursorline
set copyindent
set encoding=utf-8
set expandtab
set foldenable
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
set relativenumber
set scrolloff=10
set smartcase
set showmatch
set shiftwidth=4
set softtabstop=4
set showmatch
set title
set tm=500
set tabstop=4
set termguicolors
set undolevels=100

"--------------------------------------
"--------------------------------------
"======================================
"============ KeyBindings =============
"======================================
"--------------------------------------

let mapleader=';'

inoremap jk <Esc>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :Autoformat<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F4> :UndotreeToggle<cr>
nnoremap <F5> :YcmDiags<CR>

nnoremap <Left> <C-w><C-h>
nnoremap <Right> <C-w><C-l>
nnoremap <Up> <C-w><C-k>
nnoremap <Down> <C-w><C-j>

" Easymotion
map <Space> <Plug>(easymotion-prefix)
map <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
map <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
map <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
map <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)
map . <Plug>(easymotion-repeat)

"Autoformat
nnoremap <C-k> :Autoformat<Cr>

" 切换文件
nnoremap <Leader><Tab> :bn<CR>
nnoremap <Leader>c :bd<CR>

"--------------------------------------
"======================================
"=========== AutoCommands =============
"======================================
"--------------------------------------

augroup PreviewOnBottom
  autocmd InsertEnter * set splitbelow
  autocmd InsertLeave * set splitbelow!
augroup END

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

" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree

"--------------------------------------
"======================================
"=============== Config ===============
"======================================
"--------------------------------------
let g:deoplete#enable_at_startup = 1

"<<easymotion>>
let g:EasyMotion_smartcase = 1

"<<airline>>
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

"<<multiple-cursor>>
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

"<<nerdtree>>
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 1

"<<tagbar>>
let g:tagbar_width = 70

"<<gutter>>
let g:gitgutter_map_keys = 0

"<<indentLine>>
let g:indentLine_char = '¦'

"<<ultisnips>>
let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-n>"
let g:UltiSnipsEditSplit = "vertical"


"--------------------------------------
"======================================
"============ Functions ===============
"======================================
"--------------------------------------
