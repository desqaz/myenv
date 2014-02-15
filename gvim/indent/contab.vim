" Vim indent file
" Language:	Contab
" Author:	
" URL:		-
" Last Change:  
"

" Indent script in place for this already?
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetContabIndent()
setlocal indentkeys=
"setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,*<Return>,=*/

" Only define functions once per session
if exists("*GetContabIndent")
  finish
endif

" Clean up a line of code by removing trailing '//' comments, and trimming
" whitespace
function! Trim(line)
  return substitute(substitute(a:line, '// .*', '', ''), '^\s*\|\s*$', '', 'g')
endfunction

function! GetContabIndent()
  let num = v:lnum
  let line = Trim(getline(num))

  let pnum = prevnonblank(num - 1)
  if pnum == 0
    return 0
  endif
  let pline = Trim(getline(pnum))

  let ind = indent(pnum)

  " region blocks
  if pline =~ 'module[\s\w]*$\|loop$\|every\|\[$'
    let ind += &sw
  endif
  if line =~ '^end\s\+module;\|^end\s\+loop;\|^end\s\+every;\|^\]'
    let ind -= &sw
  endif

  return ind
endfunction
