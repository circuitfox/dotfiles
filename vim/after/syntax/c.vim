syn match cCustomParen  "?=(" contains=cParen
syn match cCustomFunc   "\w\+\s*(\@=" contains=cCustomParen

syn match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator "<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator "[!~*&%<>^;|=,+-]"
syn match cOperator "/[^/*=]"me=e-1
syn match cOperator "/$"
syn match cOperator "&&\|||"
syn match cOperator "[][]"

syn keyword cBoolean true false TRUE FALSE

hi def link cCustomFunc Function
hi def link cBoolean Boolean
