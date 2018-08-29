set nocompatible
set background=dark
if !has('gui')
    set term=$TERM
endif
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'circuitfox/vim2hs'
Plugin 'Valloric/YouCompleteMe' " Requires companion lib
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-fugitive'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim' " Requires companion lib
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'peterhoeg/vim-qml'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'beyondmarc/glsl.vim'
Plugin 'sirtaj/vim-openscad'
Plugin 'mattn/emmet-vim'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'jeaye/color_coded' " Requires companion lib
Plugin 'cespare/vim-toml'
" Fix for syntastic
" See https://github.com/rust-lang/rust.vim/issues/130
"Plugin 'rust-lang/rust.vim'
Plugin 'jlevesy/rust.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

syntax on
scriptencoding utf-8

let mapleader = ';'

filetype plugin indent on
if &term =~ "linux"
    colorscheme circuitfox-tty
else
    colorscheme circuitfox
endif

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
set number
set spell

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
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
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

" Foldtext
function! FoldTextFun()
    let line = getline(v:foldstart)
    let line_count = v:foldend - v:foldstart + 1
    let line_dash = '-'
    let line_count_text = '| ' . printf("%10s", line_count . ' lines') . ' |'
    let foldtextend = line_count_text . repeat(line_dash, 2)
    let nucolwidth = &foldcolumn + (&nu || &rnu) * &numberwidth
    let foldtextstart = strpart(line . " ", 0, (winwidth(0) - nucolwidth - foldtextend))
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + nucolwidth
    return foldtextstart . repeat(line_dash, winwidth(0) - foldtextlength) . foldtextend
endfunction
set foldtext=FoldTextFun()

if filereadable('.vim.custom')
    so .vim.custom
endif

let g:user_emmet_leader_key = '<leader>'
let g:user_emmet_mode = 'nv'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']
