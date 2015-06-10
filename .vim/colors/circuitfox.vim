set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="circuitfox"

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
hi Normal ctermfg=White ctermbg=NONE guifg=#c5c8c6 guibg=#1e1f20
hi Comment ctermfg=DarkGrey ctermbg=NONE cterm=ITALIC guifg=#65686e guibg=#1e1f20 gui=ITALIC
hi Constant ctermfg=DarkMagenta ctermbg=NONE guifg=#6d30db guibg=#1e1f20
hi Special ctermfg=Yellow ctermbg=NONE guifg=#e0934f guibg=#1e1f20 gui=NONE
hi Identifier ctermfg=DarkBlue ctermbg=NONE guifg=#057eda guibg=#1e1f20
hi Statement ctermfg=LightGrey ctermbg=NONE cterm=BOLD guifg=#c5c8c6 guibg=#1e1f20 gui=BOLD
hi PreProc ctermfg=DarkMagenta ctermbg=NONE guifg=#6d30db guibg=#1e1f20
hi Error ctermfg=DarkGrey ctermbg=Red cterm=BOLD guifg=#65686e guibg=#bd5e4b
hi Number ctermfg=Magenta ctermbg=NONE guifg=#8a58db guibg=#1e1f20
hi Boolean ctermfg=DarkMagenta ctermbg=NONE guifg=#6d30db guibg=#1e1f20
hi String ctermfg=DarkRed ctermbg=NONE guifg=#bd442c guibg=#1e1f20
hi Type ctermfg=3 ctermbg=NONE guifg=#e08428 guibg=#1e1f20
hi Function ctermfg=Green ctermbg=NONE guifg=#31b577 guibg=#1e1f20
hi LineNr ctermfg=DarkGrey ctermbg=NONE guifg=#65686e guibg=#1e1f20
hi link Operator Special
hi Search ctermfg=Black ctermbg=Blue cterm=ITALIC guifg=#2a2b2e guibg=#4192d9 gui=ITALIC
hi Title ctermfg=Blue ctermbg=NONE cterm=BOLD guifg=#4192d9 guibg=#1e1f20 gui=BOLD

" vim
hi ColorColumn ctermbg=Black guibg=#2a2b2e cterm=NONE
hi CursorLine ctermbg=Black guibg=#2a2b2e cterm=NONE
hi Folded ctermfg=Cyan ctermbg=Black cterm=ITALIC guifg=#7dd8c1 guibg=#2a2b2e gui=ITALIC
hi FoldColumn ctermbg=Black cterm=ITALIc guibg=#2a2b2e gui=ITALIC
hi VertSplit ctermfg=White ctermbg=Black cterm=NONE guifg=#2a2b2e guibg=#2a2b2e gui=NONE
hi Visual ctermbg=7 cterm=NONE
hi vimHiCtermColor ctermfg=Blue ctermbg=NONE guifg=#4192d9 guibg=#1e1f20
hi vimGroup ctermfg=Green ctermbg=NONE cterm=ITALIC guifg=#31b577 guibg=#1e1f20 gui=ITALIC

" completion menu
hi Pmenu ctermfg=Yellow ctermbg=Black guifg=#e0934f guibg=#2a2b2e
hi PmenuSel ctermfg=DarkGrey ctermbg=Black guifg=#65686e guibg=#2a2b2e
hi PmenuSbar ctermfg=NONE ctermbg=DarkGrey guifg=NONE guibg=#65686e
hi PmenuThumb ctermfg=NONE ctermbg=Yellow guifg=NONE guibg=#e0934f

" vimdiff
hi DiffAdd ctermfg=Green ctermbg=DarkGreen cterm=NONE
hi DiffChange ctermfg=DarkCyan ctermbg=DarkBlue cterm=NONE
hi DiffDelete ctermfg=DarkRed ctermbg=DarkRed cterm=NONE
hi DiffText ctermfg=Cyan ctermbg=Blue cterm=NONE

" c
hi cFunction ctermfg=Green ctermbg=NONE guifg=#31b577 guibg=#1e1f20

" ctrlp
hi StatusLine ctermfg=White ctermbg=Black guifg=#c5c8c6 guibg=#1e1f20

" ycm
hi YcmWarningSign ctermfg=Black ctermbg=3 cterm=BOLD guifg=#2a2b2e guibg=#e08428 gui=BOLD
hi YcmErrorLine ctermbg=Black guibg=#2a2b2e
hi link YcmWarningLine YcmErrorLine

hi SignColumn ctermbg=NONE guibg=NONE

" vim2hs
hi Conceal ctermfg=Yellow ctermbg=NONE cterm=ITALIC guifg=#e0934f guibg=#1e1f20 gui=ITALIC

" gitgutter
hi GitGutterAdd ctermfg=Green ctermbg=NONE cterm=NONE guifg=#31b577 guibg=NONE gui=NONE
hi GitGutterChange ctermfg=3 ctermbg=NONE cterm=NONE guifg=#e08428 guibg=NONE gui=NONE
hi GitGutterDelete ctermfg=Red ctermbg=NONE cterm=NONE guifg=#bd5e4b guibg=NONE gui=NONE
hi link GitGutterChangeDelete GitGutterChange

" buftabline
hi BufTabLineCurrent ctermfg=Yellow ctermbg=8 cterm=BOLD guifg=#65686e guibg=#2a2b2e gui=BOLD
hi BufTabLineActive ctermfg=Yellow ctermbg=Black guifg=#e0934f guibg=#2a2b2e
hi BufTabLineHidden ctermfg=3 ctermbg=Black cterm=ITALIC guifg=#e08428 guibg=#2a2b2e gui=ITALIC
hi BufTabLineFill ctermbg=Black guibg=#2a2b2e

" signature
" signature's default highlight group is 'Exception' -- and this cannot be
" changed when using dynamic highlighting
hi Exception ctermfg=Blue guifg=#4192d9
"hi SignatureMarkHL ctermfg=Blue
"hi SignatureMarkerHL ctermfg=Red
