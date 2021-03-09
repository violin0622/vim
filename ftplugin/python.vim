if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setl sw=2
setl ts=2

setlocal winwidth=82
setlocal colorcolumn=80
let b:undo_ftplugin = 'setl fo< com< cms<'

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')´
noremap <buffer> <C-]> :call CocAction('jumpDefinition')<cr>

