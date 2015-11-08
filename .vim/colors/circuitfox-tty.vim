set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="circuitfox-tty"

" Colormap
" cterm8 cterm16 color           hex
" 0      0       Black           #2a2b2e
" 4      1       DarkBlue        #057eda
" 2      2       DarkGreen       #0db461
" 6      3       DarkCyan        #03a69d
" 1      4       DarkRed         #bd442c
" 5      5       DarkMagenta     #6d30db
" 3      6       Brown           #e08428
" 7      7       LightGrey, Grey #65686e
" 0*     8       DarkGrey        #36383b
" 4*     9       Blue            #4192d9
" 2*     10      Green           #31b577
" 6*     11      Cyan            #7dd8c1
" 1*     12      Red             #bd5e4b
" 5*     13      Yellow          #e0934f
" 3*     14      Magenta         #8a58db
" 7*     15      White           #c5c8c6
"
" background: #1e1f20

" generic
hi Normal ctermfg=Grey ctermbg=NONE
hi Comment ctermfg=DarkCyan ctermbg=NONE
hi Constant ctermfg=DarkMagenta ctermbg=NONE
hi Special ctermfg=Yellow ctermbg=NONE
hi Identifier ctermfg=Blue ctermbg=NONE
hi Statement ctermfg=White ctermbg=NONE
hi PreProc ctermfg=DarkMagenta ctermbg=NONE
hi Error ctermfg=DarkGrey ctermbg=Red
hi Number ctermfg=Magenta ctermbg=NONE
hi Boolean ctermfg=DarkMagenta ctermbg=NONE
hi String ctermfg=DarkRed ctermbg=NONE
hi Type ctermfg=Brown ctermbg=NONE 
hi Function ctermfg=DarkGreen ctermbg=NONE 
hi LineNr ctermfg=DarkGrey ctermbg=NONE 
hi link Operator Special
hi Search ctermfg=Black ctermbg=Blue
hi Title ctermfg=Blue ctermbg=NONE

" vim
hi ColorColumn ctermbg=Black
hi CursorLine ctermbg=Black
hi Folded ctermfg=Cyan ctermbg=Black
hi FoldColumn ctermbg=Black
hi VertSplit ctermfg=White ctermbg=Black
hi Visual ctermbg=7
hi vimHiCtermColor ctermfg=Blue ctermbg=NONE
hi vimGroup ctermfg=DarkGreen ctermbg=NONE

" completion menu
hi Pmenu ctermfg=Brown ctermbg=Black
hi PmenuSel ctermfg=DarkGrey ctermbg=Black
hi PmenuSbar ctermfg=NONE ctermbg=DarkGrey
hi PmenuThumb ctermfg=NONE ctermbg=Brown

" vimdiff
hi DiffAdd ctermfg=Green ctermbg=DarkGreen
hi DiffChange ctermfg=DarkCyan ctermbg=DarkBlue
hi DiffDelete ctermfg=DarkRed ctermbg=DarkRed
hi DiffText ctermfg=Cyan ctermbg=Blue

" c
hi cFunction ctermfg=Green ctermbg=NONE

" ctrlp
hi StatusLine ctermfg=White ctermbg=Black guifg=#c5c8c6 guibg=#1e1f20

" ycm
hi YcmWarningSign ctermfg=Black ctermbg=3
hi YcmErrorLine ctermbg=Black
hi link YcmWarningLine YcmErrorLine

hi SignColumn ctermbg=NONE guibg=NONE

" vim2hs
hi Conceal ctermfg=Yellow ctermbg=NONE

" gitgutter
hi GitGutterAdd ctermfg=Green ctermbg=NONE
hi GitGutterChange ctermfg=3 ctermbg=NONE
hi GitGutterDelete ctermfg=Red ctermbg=NONE
hi link GitGutterChangeDelete GitGutterChange

" buftabline
hi BufTabLineCurrent ctermfg=Brown ctermbg=8
hi BufTabLineActive ctermfg=Brown ctermbg=Black
hi BufTabLineHidden ctermfg=Brown ctermbg=Black
hi BufTabLineFill ctermbg=Black

" signature
" signature's default highlight group is 'Exception' -- and this cannot be
" changed when using dynamic highlighting
hi Exception ctermfg=Blue guifg=#4192d9
"hi SignatureMarkHL ctermfg=Blue
"hi SignatureMarkerHL ctermfg=Red

hi SpellBad ctermfg=White ctermbg=DarkRed
hi SpellCap ctermfg=White ctermbg=DarkBlue
hi SpellLocal ctermfg=White ctermbg=DarkMagenta
hi SpellRare ctermfg=White ctermbg=DarkMagenta
