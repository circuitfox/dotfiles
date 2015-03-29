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

" Lightline

let g:lightline = {
    \ 'colorscheme': 'circuitfox',
    \ 'active': {
    \   'left': [ [ 'mode' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
    \             [ 'bufferline' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LLFugitive',
    \   'readonly': 'LLReadOnly',
    \   'mode': 'LLMode',
    \   'bufferline': 'LLBufferline'
    \ }
    \ }

function! LLFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LLMode()
    return lightline#mode() == 'NORMAL' ? 'NORM' :
        \ lightline#mode() == 'INSERT' ? 'INS' :
        \ lightline#mode() == 'VISUAL' ? 'VIS' :    
        \ lightline#mode() == 'V-LINE' ? 'V-LN' :
        \ lightline#mode() == 'V-BLOCK' ? 'V-BLK' :
        \ lightline#mode() == 'REPLACE' ? 'REP' : lightline#mode()
endfunction

function! LLReadOnly()
    if &filetype == 'help'
        return ''
    elseif &readonly
        return '!'
    else
        return ''
    endif
endfunction

function! LLBufferline()
    call bufferline#refresh_status()
    let b = g:bufferline_status_info.before
    let c = g:bufferline_status_info.current
    let a = g:bufferline_status_info.after
    return b . c . a
endfunction

" ctrlp
let g:ctrlp_map = '<C-P>'
let g:ctrlp_max_files = 0

" ycm
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '?'
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" bufferline
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 1

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
