set encoding=UTF-8
scriptencoding UTF-8

syntax on
syntax enable

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

let g:mapleader=';'

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1

Plug 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
Plug 'terryma/vim-smooth-scroll'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jlzhjp/vim-pair'
let g:pair_toggle_key = '<Leader>pt'
let g:pair_fly_key = '<Tab>'
let g:pair_enable_fly_key_mapping = v:false

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
let g:indentLine_conceallevel = 2
let g:indentLine_concealcursor = ""
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar'
let g:tagbar_width = 60
Plug 'mbbill/undotree'

Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }


Plug 'honza/vim-snippets'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox

set autoindent
set autoread
set autowrite
set autowriteall
set background=dark
set backup
set backupdir=~/.config/nvim/backup
set cinoptions=N-s,g0,hs,l1,t0,i4,+4,(0,w1,W4,L0
set colorcolumn=80
set completeopt=menuone,noinsert,preview
set copyindent
set cursorline
set expandtab
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
set number
set relativenumber
set scrolloff=10
set shortmess+=c
set showmatch
set smartcase
set splitbelow
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab
set tabstop=8
set title
set timeoutlen=500
set termguicolors
set undolevels=100
set whichwrap=b,>,<,],[
set wildmenu
set wildmode=longest:full,full
set wrap

function! ClosePreview()
  if !pumvisible()
    pclose
  endif
endfunction

function! s:ToggleBackground()
  if exists('s:_background_transparent') && s:_background_transparent
    try
      execute 'colorscheme '.g:colors_name
    catch
      execute 'colorscheme default'
    endtry
    let s:_background_transparent = v:false
  else
    highlight Normal guibg=NONE ctermbg=NONE
    let s:_background_transparent = v:true
  endif
endfunction

function! s:Tab() abort
  if pumvisible()
    return "\<C-Y>"
  else
    return g:PairFly()
  endif
endfunction

function! s:SelectCurrentWord() abort
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

inoremap jk <Esc>
noremap <C-S> :w<CR>
imap <silent> <expr> <Tab> <SID>Tab()

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-C> :bp\|bd #<CR>

nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :UndotreeToggle<CR>
nnoremap <silent> <F5> :call <SID>ToggleBackground()<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

nnoremap <Left> <C-W><C-H>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Down> <C-W><C-J>

nnoremap <C-P> :CocList files<CR>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

nmap <silent> <expr> <C-N> <SID>SelectCurrentWord()
xmap <silent> <C-N> <Plug>(coc-cursors-range)

inoremap <silent> <expr> <C-Space> coc#refresh()
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>ff <Plug>(coc-format)

nmap <Space> <Plug>(easymotion-prefix)
nmap <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
nmap <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
nmap <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
nmap <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)

nmap <silent> <C-_> <Leader>c<Space>
xmap <silent> <C-_> <Leader>c<Space>

noremap <silent> <C-U> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <C-D> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <C-B> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <C-F> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

augroup Preview
  autocmd!
  autocmd CompleteDone,InsertLeave * call ClosePreview()
augroup END

augroup FileTypes
  autocmd!
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" vim: foldmethod=marker: tabstop=8: softtabstop=2: shiftwidth=2: expandtab
