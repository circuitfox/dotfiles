set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="circuitfox"

" generic
hi Normal ctermfg=White ctermbg=NONE
hi Comment ctermfg=8 ctermbg=NONE cterm=ITALIC
hi Constant ctermfg=DarkMagenta ctermbg=NONE
hi Special ctermfg=Yellow ctermbg=NONE
hi Identifier ctermfg=DarkBlue ctermbg=NONE
hi Statement ctermfg=LightGrey ctermbg=NONE cterm=BOLD
hi PreProc ctermfg=DarkMagenta ctermbg=NONE
hi Error ctermfg=8 ctermbg=Red cterm=BOLD
hi Number ctermfg=Magenta ctermbg=NONE
hi Boolean ctermfg=DarkMagenta ctermbg=NONE
hi String ctermfg=DarkRed ctermbg=NONE
hi Type ctermfg=3 ctermbg=NONE
hi Function ctermfg=Green ctermbg=NONE
hi LineNr ctermfg=8 ctermbg=NONE
hi link Operator Special
hi Search ctermfg=Black ctermbg=Blue cterm=ITALIC
hi Title ctermfg=Blue ctermbg=NONE cterm=BOLD

" color_coded
hi Member ctermfg=DarkGreen ctermbg=NONE
hi Variable ctermfg=DarkCyan ctermbg=NONE
hi Namespace ctermfg=DarkBlue ctermbg=NONE
hi EnumConstant ctermfg=DarkRed ctermbg=NONE
hi StructDecl ctermfg=Blue ctermbg=NONE
hi UnionDecl ctermfg=Blue ctermbg=NONE
hi ClassDecl ctermfg=Blue ctermbg=NONE
hi EnumDecl ctermfg=Blue ctermbg=NONE
hi ParmDecl ctermfg=Cyan ctermbg=NONE
hi TypeRef ctermfg=DarkBlue ctermbg=NONE

" vim
hi ColorColumn ctermbg=Black cterm=NONE
hi CursorLine ctermbg=Black cterm=NONE
hi Folded ctermfg=Cyan ctermbg=Black cterm=ITALIC
hi FoldColumn ctermbg=Black cterm=ITALIc
hi VertSplit ctermfg=White ctermbg=Black cterm=NONE
hi Visual ctermbg=7 cterm=NONE
hi vimHiCtermColor ctermfg=Blue ctermbg=NONE
hi vimGroup ctermfg=Green ctermbg=NONE cterm=ITALIC

" completion menu
hi Pmenu ctermfg=Yellow ctermbg=Black
hi PmenuSel ctermfg=8 ctermbg=Black
hi PmenuSbar ctermfg=NONE ctermbg=8
hi PmenuThumb ctermfg=NONE ctermbg=Yellow

" vimdiff
hi DiffAdd ctermfg=Green ctermbg=DarkGreen cterm=NONE
hi DiffChange ctermfg=DarkCyan ctermbg=DarkBlue cterm=NONE
hi DiffDelete ctermfg=DarkRed ctermbg=DarkRed cterm=NONE
hi DiffText ctermfg=Cyan ctermbg=Blue cterm=NONE

" c
hi cFunction ctermfg=Green ctermbg=NONE

" ctrlp
hi StatusLine ctermfg=White ctermbg=Black

" ycm
hi YcmWarningSign ctermfg=Black ctermbg=3 cterm=BOLD
hi YcmErrorLine ctermbg=Black
hi link YcmWarningLine YcmErrorLine

hi SignColumn ctermbg=NONE

" vim2hs
hi Conceal ctermfg=Yellow ctermbg=NONE cterm=BOLD

" gitgutter
hi GitGutterAdd ctermfg=Green ctermbg=NONE cterm=NONE
hi GitGutterChange ctermfg=3 ctermbg=NONE cterm=NONE
hi GitGutterDelete ctermfg=Red ctermbg=NONE cterm=NONE
hi link GitGutterChangeDelete GitGutterChange

" buftabline
hi BufTabLineCurrent ctermfg=Yellow ctermbg=8 cterm=BOLD
hi BufTabLineActive ctermfg=Yellow ctermbg=Black
hi BufTabLineHidden ctermfg=3 ctermbg=Black cterm=ITALIC
hi BufTabLineFill ctermbg=Black

" signature
" signature's default highlight group is 'Exception' -- and this cannot be
" changed when using dynamic highlighting
hi Exception ctermfg=Blue
"hi SignatureMarkHL ctermfg=Blue
"hi SignatureMarkerHL ctermfg=Red

hi SpellBad ctermfg=White ctermbg=DarkRed
hi SpellCap ctermfg=White ctermbg=DarkBlue
hi SpellLocal ctermfg=White ctermbg=DarkMagenta
hi SpellRare ctermfg=White ctermbg=DarkMagenta
