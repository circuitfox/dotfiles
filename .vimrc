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

call vundle#end()

syntax on
scriptencoding utf-8

set encoding=utf-8
set expandtab
set hlsearch
set laststatus=2
set shiftwidth=4
set softtabstop=4

filetype plugin indent on
colorscheme circuitfox

" html should indent on twos
au FileType html setl sw=2 sts=2 et

" Lightline
let g:lightline = {
    \ 'colorscheme': 'circuitfox',
    \ 'component_function': {
    \   'readonly': 'LLReadOnly',
    \   'mode': 'LLMode'
    \ }
    \ }

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

" ctrlp
let g:ctrlp_map = '<C-P>'

" Theme Debugging {
"    " adds to statusline
"    set laststatus=2
"    set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')} " "    " a little more informative version of the above
"    nmap <C-S-P> :call <SID>SynStack()<CR>
"
"    function! <SID>SynStack()
"        if !exists("*synstack")
"            return
"        endif
"        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"    endfunc
" }

if filereadable('.vim.custom')
    so .vim.custom
endif
