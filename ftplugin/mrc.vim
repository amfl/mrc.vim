" Language: mIRC
" Maintainer: amfl <amfl@none.none>

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

setlocal suffixesadd=.mrc,.ini
setlocal commentstring=;%s

setlocal expandtab " mIRC doesn't like \t
setlocal tabstop=2 shiftwidth=2

