set nocompatible
set background=dark
if !has('gui')
    set term=$TERM
endif
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'dag/vim2hs'
Plugin 'Valloric/YouCompleteMe' " Requires companion lib
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
" neco-ghc and ghcmod-vim depend on ghc-mod,
" which breaks projects with cabal >= 1.22
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim' " Requires companion lib
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'peterhoeg/vim-qml'

call vundle#end()

syntax on
scriptencoding utf-8

let mapleader = ';'

filetype plugin indent on
colorscheme circuitfox

set modelines=0

if has('gui_running')
    set guifont=Source\ Code\ Pro\ 10
endif

" *.md means markdown
au Bufread,BufNewFile *.md set ft=markdown

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set showcmd
set noshowmode
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" hjkl for movement, and only in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" jj and <esc> are synonyms
inoremap jj <esc>

" Creates a new window if it does not exist
" or else moves to the window specified by `key'
function! WinMove(key)
    let t:curwin = winnr()
    exec 'wincmd ' . a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec 'wincmd ' . a:key
    endif
endfunction

" Move between windows
map <leader>h :call WinMove('h')<cr>
map <leader>j :call WinMove('j')<cr>
map <leader>k :call WinMove('k')<cr>
map <leader>l :call WinMove('l')<cr>

" Move windows around
map <leader>H :wincmd H<cr>
map <leader>J :wincmd J<cr>
map <leader>K :wincmd K<cr>
map <leader>L :wincmd L<cr>

" Resize window
map <leader>rh :3wincmd <<cr>
map <leader>rj :3wincmd -<cr>
map <leader>rk :3wincmd +<cr>
map <leader>rl :3wincmd ><cr>

" Close / Rotate windows
map <leader>wc :wincmd q<cr>
map <leader>wr <c-w>r

if filereadable('.vim.custom')
    so .vim.custom
endif
