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
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'

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

" html should indent on twos
au FileType html setl sw=2 sts=2 et

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>

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

" ycm
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '?'

" bufferline
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 1

if filereadable('.vim.custom')
    so .vim.custom
endif
