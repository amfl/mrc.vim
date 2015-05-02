" Vim syntax file
" Language:     mIRC
" Maintainer:   amfl <amfl@none.none>, Luke Triantafyllidis <ltriant[at]cpan.org>
" Last Change:  2015 May 03
" Creation:     2005 May 05

" Todo: error checking (brackets most importantly)
"       match aliases with space after them, or end of line
"       NEEDS TO BE FINISHED BY SOMEONE!

if version < 600
	syn clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore

" attempt to match commands/aliases
syn match   mrcStatement   "^ *[^ {}()]\+ "me=e-1
syn match   mrcStatement   "| [^ {}()]\+ "ms=s+2,me=e-1

" single and multi-line comments
syn region  mrcComment     start="/\*" end="\*/"
syn match   mrcComment     "^ *;.*"
syn match   mrcComment     "| ;.*"ms=s+2
syn match   mrcComment     "| ;.* |"ms=s+2,me=e-2

" variables, identifiers etc...
syn match   mrcStatement   "^ *alias "
syn match   mrcNumber      "\<[0-9]\+\>"
syn match   mrcNumber      "-[0-9]\+"
syn match   mrcNumber      "\<[0-9]*\.[0-9]\+\>"
syn match   mrcNumber      "-[0-9]*\.[0-9]\+"
syn match   mrcVar         "%[^()/ ,]\+"
syn match   mrcIdentifier  "$[^()/ ,]\+"
syn keyword mrcConditional if else while

" operators
syn match   mrcOperator    " = "ms=s+1,me=e-1
syn match   mrcOperator    " == "ms=s+1,me=e-1
syn match   mrcOperator    " === "ms=s+1,me=e-1
syn match   mrcOperator    " != "ms=s+1,me=e-1
syn match   mrcOperator    " < "ms=s+1,me=e-1
syn match   mrcOperator    " > "ms=s+1,me=e-1
syn match   mrcOperator    " <= "ms=s+1,me=e-1
syn match   mrcOperator    " >= "ms=s+1,me=e-1
syn match   mrcOperator    " & "ms=s+1,me=e-1
syn match   mrcOperator    " && "ms=s+1,me=e-1
syn match   mrcOperator    " || "ms=s+1,me=e-1
syn match   mrcOperator    " !\{0,1}is\(incs\|in\|wmcs\|wm\|num\|letter\|alnum\|alpha\|lower\|upper\|on\|op\|hop\|voice\|ref\|chan\|ban\|aop\|avoice\|ignore\|protect\|notify\)"ms=s+1

" event highlighting
syn match   mrcUserLevel   "^on .\+:"ms=s+4,me=e-1
syn match   mrcStatement   "^on "me=e-1

if version >= 508 || !exists("did_mrc_syn_inits")
	if version < 508
		let did_mrc_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink mrcVar         PreProc
	HiLink mrcIdentifier  Identifier
	HiLink mrcNumber      Number
	HiLink mrcStatement   Statement
	HiLink mrcConditional Statement
	HiLink mrcComment     Comment
	HiLink mrcOperator    Operator
	HiLink mrcUserLevel   mrcVar

	delcommand HiLink
endif

let b:current_syntax = "mirc"

" vim: ts=8
