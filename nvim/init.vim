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
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jlzhjp/vim-pair'
Plug 'Chiel92/vim-autoformat'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

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
set winheight=50
set winwidth=150
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

"--------------------------------------
"======================================
"=========== AutoCommands =============
"======================================
"--------------------------------------

" augroup PreviewOnBottom
"     autocmd InsertEnter * set splitbelow
"     autocmd InsertLeave * set splitbelow!
" augroup END

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

augroup FiletypeGroup
  autocmd!
  autocmd BufNewFile,BufRead *.h set filetype=cpp
augroup END
augroup CleanUp
  autocmd!
  autocmd VimLeavePre * execute '!rm ./*.pch && rm ./*.tmp && rm ./*.tu'
augroup END

"--------------------------------------
"--------------------------------------
"======================================
"============ KeyBindings =============
"======================================
"--------------------------------------

let g:mapleader=';'

inoremap jk <Esc>

nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>w :w<CR>

nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :UndotreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

nnoremap <silent> <Leader>f :Autoformat<CR>

nnoremap <S-Tab> :bn<CR>
nnoremap <silent> <C-c> :bd<CR>

nnoremap <silent> <Leader>h :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

nnoremap <M-h> <C-w><C-h>
nnoremap <M-l> <C-w><C-l>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-j> <C-w><C-j>

nmap <Space> <Plug>(easymotion-prefix)
nmap <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
nmap <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
nmap <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
nmap <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

nmap <Leader>pt <Plug>(vimpair-toggle)
imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Plug>(vimpair-tab)"

"--------------------------------------
"======================================
"=============== Config ===============
"======================================
"--------------------------------------

" <<deoplete>>
let g:deoplete#enable_at_startup = 1

" <<easymotion>>
let g:EasyMotion_smartcase = 1

" <<airline>>
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'

" <<multiple-cursor>>
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_key = '<C-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'

" <<nerdtree>>
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 1

" <<tagbar>>
let g:tagbar_width = 70

" <<gutter>>
let g:gitgutter_map_keys = 0

" <<indentLine>>
let g:indentLine_char = '¦'

" <<ALE>>
let g:ale_cpp_clang_options = '-std=c++1z -Wall -Wextra'
let g:ale_cpp_gcc_options = '-std=c++1z -Wall -Wextra'
let g:ale_linters = {'cpp': ['clang',]}

let s:colors = {
      \'onedark':{ 'scheme':'onedark', 'airline': 'onedark', },
      \'molokai': { 'scheme':'molokai', 'airline': 'molokai', },
      \'gruvbox': { 'scheme': 'gruvbox', 'airline': 'gruvbox', },
      \'solarized': { 'scheme':'NeoSolarized', 'airline': 'solarized', },
      \}

"--------------------------------------
"======================================
"============= Functions ==============
"======================================
"--------------------------------------
function! ListColors(...)
  return keys(s:colors)
endfunction

function! SetColor(name)
  silent execute 'colorscheme '.s:colors[a:name]['scheme']
  silent execute 'AirlineTheme '.s:colors[a:name]['airline']
endfunction

"--------------------------------------
"======================================
"============= Commands ===============
"======================================
"--------------------------------------
command! -narg=1 -complete=customlist,ListColors SetColor :call SetColor(<f-args>)

"--------------------------------------
"======================================
"============= Highlight ==============
"======================================
"--------------------------------------

highlight Normal guibg=NONE ctermbg=NONE
