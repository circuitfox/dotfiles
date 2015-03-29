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

