" Vim syntax file
" Language:	eros
" Maintainer:	Lucas Gabriel Sanchez <unkiwii@gmail.com>
" Last Change:	2017 Jun 13

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" We need nocompatible mode.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match erosNumber    /[^0-9][0-9][0-9]*/hs=s+1
syn match erosNumber    /[^0-9][0-9][0-9]*\.[0-9][0-9]*/hs=s+1
syn match erosType      /^[A-Z][a-zA-Z0-9]*[a-z0-9]/
syn match erosType      /[^A-Za-z0-9][A-Z][a-zA-Z0-9]*[a-z0-9]/hs=s+1
syn match erosString    /"[^"]*"/
syn match erosChar      /'.'/
syn match erosComment   /#.*$/

if version >= 508 || !exists("did_eros_syn_inits")
  if version <= 508
    let did_eros_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink erosNumber     Constant
  HiLink erosType       Type
  HiLink erosString     String
  HiLink erosChar       String
  HiLink erosComment    Comment

  delcommand HiLink
endif

let b:current_syntax = "eros"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=2 et:
