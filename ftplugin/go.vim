" Vim filetype plugin file
" Language:	Go
" Maintainer:	David Barnett (https://github.com/google/vim-ft-go)
" Last Change:	2014 Aug 16

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal winwidth=82
setlocal colorcolumn=80
noremap <buffer> <C-]> :call CocAction('jumpDefinition')<cr>
let b:undo_ftplugin = 'setl fo< com< cms<'
" vim: sw=2 sts=2 et
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')´
