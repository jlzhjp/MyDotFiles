set encoding=UTF-8
scriptencoding UTF-8

let g:mapleader=';'

"--------------------------------------
"======================================
"============= Plugins ================
"======================================
"--------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'Lokaltog/vim-easymotion'
nmap <Space> <Plug>(easymotion-prefix)
nmap <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
nmap <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
nmap <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
nmap <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1

Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'jlzhjp/vim-pair', { 'branch': 'dev' }
let g:pair_toggle_key = '<Leader>pt'
let g:pair_fly_key = '<Tab>'
let g:pair_enable_fly_key_mapping = v:false

Plug 'Chiel92/vim-autoformat'
nnoremap <silent> <Leader>f :Autoformat<CR>

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '¦'

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <silent> <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 1

Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_width = 60

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nnoremap <silent> <F4> :UndotreeToggle<CR>

Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'w0rp/ale'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_cpp_clang_options = '-std=c++1z -Wall -Wextra'
let g:ale_cpp_gcc_options = '-std=c++1z -Wall -Wextra'
let g:ale_cpp_clangcheck_options = '-std=c++1z -Wall -Wextra'

Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-clang'
Plug 'callmekohei/deoplete-fsharp', { 'do': 'bash install.bash' }
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<M-j>"
let g:UltiSnipsJumpForwardTrigger="<M-h>"
let g:UltiSnipsJumpBackwardTrigger="<C-l>"
let g:UltiSnipsEditSplit="vertical"

Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/csharp.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'plasticboy/vim-markdown'

call plug#end()

syntax on
syntax enable
colorscheme seoul256

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set autoindent
set autoread
set autowrite
set autowriteall
set background=dark
set backup
set backupdir=~/.config/nvim/backup
set colorcolumn=80
set completeopt=longest,menuone,noinsert,preview
set cursorline
set copyindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set foldenable
set hidden
set history=100
set hlsearch
set incsearch
set lazyredraw
set mouse=a
set mousehide
set magic
set fileformat=unix
set number
set relativenumber
set scrolloff=10
set smartcase
set showmatch
set title
set timeoutlen=500
set termguicolors
set undolevels=100

augroup PreviewOnBottom
  autocmd!
  autocmd InsertEnter * set splitbelow
  autocmd InsertLeave * set splitbelow!
augroup end

augroup IndentSetting
  autocmd!
  autocmd FileType vim
        \  setlocal shiftwidth=2
        \| setlocal tabstop=2
        \| setlocal softtabstop=2
  autocmd FileType javascript
        \  setlocal shiftwidth=2
        \| setlocal tabstop=2
        \| setlocal softtabstop=2
  autocmd FileType html
        \  setlocal shiftwidth=2
        \| setlocal tabstop=2
        \| setlocal softtabstop=2
  autocmd FileType css
        \  setlocal shiftwidth=2
        \| setlocal tabstop=2
        \| setlocal softtabstop=2
augroup end

inoremap jk <Esc>

inoremap <expr> <silent> <Tab> pumvisible() ? "\<C-y>" : b:pair_controller.Fly()

nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>w :w<CR>

nnoremap <silent> <S-Tab> :bn<CR>
nnoremap <silent> <C-c> :bd<CR>

nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

nnoremap <M-H> <C-w><C-h>
nnoremap <M-L> <C-w><C-l>
nnoremap <M-K> <C-w><C-k>
nnoremap <M-J> <C-w><C-j>
nnoremap <M-=> <C-w><C-=>

" highlight Normal guibg=NONE ctermbg=NONE
