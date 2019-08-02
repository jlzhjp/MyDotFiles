set encoding=UTF-8
scriptencoding UTF-8

let g:mapleader=';'

silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1

Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jlzhjp/vim-pair', { 'branch': 'dev' }
let g:pair_toggle_key = '<Leader>pt'
let g:pair_fly_key = '<Tab>'
let g:pair_enable_fly_key_mapping = v:false

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
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 1
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
let g:tagbar_width = 60
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
Plug 'ctrlpvim/ctrlp.vim'

Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'python': ['pyls'],
  \ }

call plug#end()

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length', 2)
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['String', 'Comment'])

syntax on
syntax enable
colorscheme one

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
set splitbelow
set softtabstop=4
set tabstop=4
set foldenable
set fileformat=unix
set hidden
set history=100
set hlsearch
set incsearch
set lazyredraw
set mouse=a
set mousehide
set magic
set shortmess+=c
set number
set relativenumber
set scrolloff=10
set smartcase
set showmatch
set title
set timeoutlen=500
set termguicolors
set undolevels=100

function! Tab()
  if pumvisible()
    return "\<C-Y>"
  else
    return b:pair_controller.Fly()
  endif
endfunction

function! ClosePreview()
  if !pumvisible()
    pclose
  endif
endfunction

function! SetLSPShortcuts()
  nnoremap gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

inoremap jk <Esc>

noremap <C-S> :w<CR>

nnoremap <silent> <S-Tab> :bn<CR>
nnoremap <silent> <C-C> :bd<CR>

inoremap <expr> <Tab> Tab()

nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :Autoformat<CR>
nnoremap <silent> <F4> :UndotreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

nmap <Space> <Plug>(easymotion-prefix)
nmap <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
nmap <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
nmap <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
nmap <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)

noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>


autocmd InsertLeave,CompleteDone * call ClosePreview()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END


" 背景透明
" highlight Normal guibg=NONE ctermbg=NONE
"
" vim: foldmethod=marker: tabstop=2: softtabstop=2: shiftwidth=2: expandtab
