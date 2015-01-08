set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="circuitfox"

" cterm
" generic
hi Normal ctermfg=White ctermbg=NONE
hi Comment ctermfg=DarkGrey ctermbg=NONE cterm=ITALIC
hi Constant ctermfg=DarkMagenta ctermbg=NONE
hi Special ctermfg=Yellow ctermbg=NONE
hi Identifier ctermfg=DarkBlue ctermbg=NONE
hi Statement ctermfg=LightGrey ctermbg=NONE cterm=BOLD
hi PreProc ctermfg=DarkMagenta ctermbg=NONE
hi Error ctermfg=Black ctermbg=Red
hi Number ctermfg=Magenta ctermbg=NONE
hi Boolean ctermfg=DarkMagenta ctermbg=NONE
hi String ctermfg=DarkRed ctermbg=NONE
hi Type ctermfg=3 ctermbg=NONE
hi Function ctermfg=Green ctermbg=NONE
hi LineNr ctermfg=DarkGrey ctermbg=NONE
hi link Operator Special
hi Search ctermfg=Black ctermbg=Blue cterm=ITALIC

" vim
hi vimHiCtermColor ctermfg=Blue ctermbg=NONE
hi vimGroup ctermfg=Green ctermbg=NONE cterm=ITALIC

" c
hi cFunction ctermfg=Green ctermbg=NONE

" ctrlp
hi StatusLine ctermfg=White ctermbg=Black 
