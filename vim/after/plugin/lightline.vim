let g:lightline = {
    \ 'colorscheme': 'circuitfox',
    \ 'active': {
    \   'left': [ [ 'mode' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
    \             [ 'syntastic', 'bufferline' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LLFugitive',
    \   'readonly': 'LLReadOnly',
    \   'mode': 'LLMode',
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatusLineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
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
