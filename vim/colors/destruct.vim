" Vim color file
" Made by Mustafa Oezkan, destruct.c at gmx dot net
" Last change: 2007 Jan 19

" Remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "destruct"

hi Normal	ctermfg=white		ctermbg=NONE

hi Constant	ctermfg=darkyellow	ctermbg=NONE
hi Identifier	ctermfg=lightblue	ctermbg=NONE
hi Special	ctermfg=lightred	ctermbg=NONE
hi Statement	ctermfg=darkred		ctermbg=NONE
hi Preproc	ctermfg=darkmagenta	ctermbg=NONE
hi Type		ctermfg=darkblue	ctermbg=NONE
hi String	ctermfg=darkgreen	ctermbg=NONE
hi Operator	ctermfg=darkred		ctermbg=NONE

hi Comment	ctermfg=grey		ctermbg=NONE 
hi Visual	ctermfg=lightblue	ctermbg=NONE
hi Search	ctermfg=white		ctermbg=yellow
hi IncSearch	ctermfg=cyan		ctermbg=darkyellow

hi WarningMsg	ctermfg=black		ctermbg=darkred
hi MoreMsg	ctermfg=darkgreen	ctermbg=NONE
hi ErrorMsg	ctermfg=white		ctermbg=red
hi ModeMsg	ctermfg=white		ctermbg=NONE		cterm=bold
hi WildMenu	ctermfg=cyan		ctermbg=magenta
hi StatusLine	ctermfg=black		ctermbg=yellow    
hi StatusLineNC	ctermfg=black		ctermbg=white
hi VertSplit	ctermfg=black		ctermbg=yellow
hi Error	ctermfg=white		ctermbg=red
hi Todo		ctermfg=white		ctermbg=magenta
hi Title	ctermfg=magenta		ctermbg=NONE		cterm=bold
hi Question	ctermfg=grey		ctermbg=NONE
hi LineNr	ctermfg=lightyellow	ctermbg=NONE
hi Directory	ctermfg=cyan		ctermbg=NONE 
hi NonText	ctermfg=red		ctermbg=NONE
hi SpecialKey	ctermfg=darkcyan	ctermbg=NONE

hi DiffAdd	ctermfg=darkblue	ctermbg=gray
hi DiffChange	ctermfg=green		ctermbg=lightred
hi DiffDelete	ctermfg=darkgreen	ctermbg=lightyellow
hi DiffText	ctermfg=white		ctermbg=cyan

hi Folded	ctermfg=lightcyan	ctermbg=black

hi Cursor	ctermfg=black		ctermbg=green
"hi ncursor	ctermfg=red		ctermbg=black
"hi rcursor	ctermfg=
"hi vcursor	ctermfg=
