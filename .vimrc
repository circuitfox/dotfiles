set nocompatible
set nu
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

set encoding=utf-8
set expandtab
set hlsearch
set laststatus=2
set shiftwidth=4
set softtabstop=4
set noshowmode

let mapleader = ';'

filetype plugin indent on
colorscheme circuitfox

if has('gui_running')
    set guifont=Source\ Code\ Pro\ 10
endif

" *.md means markdown
au Bufread,BufNewFile *.md set ft=markdown

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

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
map <leader>h :call WinMove('h')<CR>
map <leader>j :call WinMove('j')<CR>
map <leader>k :call WinMove('k')<CR>
map <leader>l :call WinMove('l')<CR>

" Move windows around
map <leader>H :wincmd H<CR>
map <leader>J :wincmd J<CR>
map <leader>K :wincmd K<CR>
map <leader>L :wincmd L<CR>

" Resize window
map <leader>rh :3wincmd <<CR>
map <leader>rj :3wincmd -<CR>
map <leader>rk :3wincmd +<CR>
map <leader>rl :3wincmd ><CR>

" Close / Rotate windows
map <leader>wc :wincmd q<CR>
map <leader>wr <C-W>r

if filereadable('.vim.custom')
    so .vim.custom
endif
