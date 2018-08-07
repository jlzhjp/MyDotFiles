set encoding=UTF-8
scriptencoding UTF-8

"--------------------------------------
"======================================
"============= Plugins ================
"======================================
"--------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'
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
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key = '<C-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'jlzhjp/vim-pair'
nmap <Leader>pt <Plug>(vimpair-toggle)

Plug 'Chiel92/vim-autoformat'
nnoremap <silent> <Leader>f :Autoformat<CR>

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

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
let g:tagbar_width = 70

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nnoremap <silent> <F4> :UndotreeToggle<CR>

Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Valloric/YouCompleteMe'
nnoremap <silent> <F5> :YcmDiags<CR>
nnoremap <silent> <Leader>fi :YcmCompleter FixIt<CR>
let g:ycm_warning_symbol = '--'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"
let g:UltiSnipsEditSplit="vertical"

Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'icymind/NeoSolarized'

Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

syntax on
syntax enable
colorscheme onedark

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set autoindent
set autoread
set autowrite
set autowriteall
set background=dark
set backup
set backupdir=~/.config/nvim/backup
set colorcolumn=80
set cursorline
set copyindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set foldenable
set guifont=Source\ Code\ Pro\ 11
set guioptions-=m
set guioptions-=T
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
set showmatch
set title
set timeoutlen=500
set termguicolors
set undolevels=100

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
  autocmd FileType html setlocal shiftwidth=2
        \|setlocal tabstop=2
        \|setlocal softtabstop=2
  autocmd FileType css setlocal shiftwidth=2
        \|setlocal tabstop=2
        \|setlocal softtabstop=2
augroup END

let g:mapleader=';'

inoremap jk <Esc>

nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>w :w<CR>

nnoremap <S-Tab> :bn<CR>
nnoremap <silent> <C-c> :bd<CR>

nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

nnoremap <M-h> <C-w><C-h>
nnoremap <M-l> <C-w><C-l>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-j> <C-w><C-j>

imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Plug>(vimpair-tab)"

let s:colors = {
      \'onedark':{ 'scheme':'onedark', 'airline': 'onedark', },
      \'molokai': { 'scheme':'molokai', 'airline': 'molokai', },
      \'gruvbox': { 'scheme': 'gruvbox', 'airline': 'gruvbox', },
      \'solarized': { 'scheme':'NeoSolarized', 'airline': 'solarized', },
      \}

function! ListColors(arg_lead, ...)
  return filter(keys(s:colors), { val -> val =~ a:arg_lead })
endfunction

function! SetColor(name)
  silent execute 'colorscheme '.s:colors[a:name]['scheme']
  silent execute 'AirlineTheme '.s:colors[a:name]['airline']
endfunction

command! -narg=1 -complete=customlist,ListColors SetColor :call SetColor(<f-args>)

"背景透明
"highlight Normal guibg=NONE ctermbg=NONE
