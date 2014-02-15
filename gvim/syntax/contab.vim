" Vim syntax file
" Language:			Contab (ESTEREL)
" Maintainer:		
" Credits:			
" First Release:	
" Last Change:		
" Version:			

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" case is significant
syn case ignore
" Esterel Regions
syn region contabModule			start=/module/		end=/end module/	contains=ALLBUT,contabModule	fold
syn region contabLoop			start=/loop/		end=/end loop/		contains=ALLBUT,contabModule	fold
syn region contabRepeat			start=/repeat/		end=/until/			contains=ALLBUT,contabModule	fold
syn region contabEvery			start=/every/		end=/end every/	contains=ALLBUT,contabModule	fold
syn region contabIf				start=/if/			end=/end if/		contains=ALLBUT,contabModule	fold
syn region contabConcurrent	start=/\[/			end=/\]/				contains=ALLBUT,contabModule	transparent
syn region contabIfThen			start=/if/			end=/then/			oneline
" Esterel Keywords

syn keyword contabStatement and or not
syn keyword contabStatement registername myself null include exit
syn keyword contabStatement every each upto timeout watching
syn keyword contabStatement do in break next loop pool halt yield
syn keyword contabStatement if fi endif then else elsif otherwise switch
syn keyword contabStatement case default while until repeat times nothing
syn keyword contabStatement filter scope begin inc dec signal
syn keyword contabStatement trigger constant const module template instanciate end
syn keyword contabStatement await wait sleep when emit extern local queued message
syn keyword contabStatement var variable seconds second send msg call jsonparse
syn keyword contabStatement jsonstring dumpstack register unregister echo
syn keyword contabStatement match print tprint
syn keyword contabSpecial   true false

" Comment
syn keyword	contabTodo		contained TODO FIXME XXX
syn match contabComment		"#.*$"  contains=contabTodo,@Spell
" Operators and special characters
syn match contabSpecialChar		display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region contabString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=contabSpecialChar,@Spell
syn match contabSpecial		":"
syn match contabSpecial		"<="
syn match contabSpecial		">="
syn match contabSpecial		"+"
syn match contabSpecial		"-"
syn match contabSpecial		"="
syn match contabSpecial		";"
syn match contabSpecial		"/"
syn match contabSpecial		"?"
syn match contabOperator	"\["
syn match contabOperator	"\]"
syn match contabOperator	":="
syn match contabOperator	"||"
syn match contabStatement	"\<\(if\|else\)\>"
syn match contabNone			"\<else\s\+if\>$"
syn match contabNone			"\<else\s\+if\>\s"

" Class Linking
hi def link contabStatement	Statement
hi def link contabType			Type
hi def link contabComment		Comment
hi def link contabBoolean		Number
hi def link contabExpressions Number
hi def link contabString		String
hi def link contabOperator		Type
hi def link contabSysCall		Type
hi def link contabFunctions	Type
hi def link contabSpecialChar		SpecialChar
hi def link contabSpecial		SpecialChar
hi def link contabTodo			Todo



let b:current_syntax = "contab"
