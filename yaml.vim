" Vim indent file
" Language: Yaml
" Author: Ian Young

if exists("b:did_indent")
  finish
endif
"runtime! indent/ruby.vim
"unlet! b:did_indent
let b:did_indent = 1

setlocal autoindent ts=2 sts=2 sw=2 et
setlocal indentexpr=GetYamlIndent()
setlocal indentkeys=o,O,*<Return>,!^F

function! GetYamlIndent()
  let prevlnum = v:lnum - 1
  if prevlnum == 0
    return 0
  endif
  let line = substitute(getline(v:lnum),'\s\+$','','')
  let prevline = substitute(getline(prevlnum),'\s\+$','','')

  let indent = indent(prevlnum)
  let increase = indent + &sw
  let decrease = indent - &sw

  if prevline =~ ':$'
    return increase
  elseif prevline =~ '^\s\+\-' && line =~ '^\s\+[^-]\+:'
    return decrease
  else
    return indent
  endif
endfunction

" vim:set sw=2:

" add yaml stuffs
# au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
# autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
