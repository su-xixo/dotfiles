" General
set nocompatible
set encoding=utf-8
set hidden
set mouse=a
set history=1000
set undofile
set nobackup
set nowritebackup
set noswapfile

" UI
set number
set relativenumber
set cursorline
set showmatch
set ruler
set laststatus=2
set signcolumn=yes
set wildmenu
set termguicolors

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Scrolling
set scrolloff=8
set sidescrolloff=8

" Splits
set splitbelow
set splitright

" File handling
set autoread
set fileencoding=utf-8

" Disable annoying swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Better completion
set completeopt=menuone,noinsert,noselect

" Syntax highlighting
syntax enable
filetype plugin indent on

" Leader key
let mapleader = " "

" ========================================
" Key Mappings
" ========================================

" Save
nnoremap <leader>ww :write<CR>

" Quit
nnoremap <leader>qq :quit<CR>

" Save and quit
nnoremap <leader>x :x<CR>

" Clear search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Move lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

" Move lines left/right (optional)
nnoremap <M-h> <<
nnoremap <M-l> >>

" Move selected lines
xnoremap <M-j> :m '>+1<CR>gv=gv
xnoremap <M-k> :m '<-2<CR>gv=gv

" Keep cursor centered while jumping
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" ========================================
" Auto Commands
" ========================================

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Remember cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute "normal! g`\"" |
    \ endif

" ========================================
" Theme
" ========================================

if has('termguicolors')
    set termguicolors
endif

" Use a built-in dark theme
set background=dark
colorscheme catppuccin

