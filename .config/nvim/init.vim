" Settings {{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
" From the Book `Pratical Vim` {{{
" %% expands to the path of the active buffer ( eq : %:h<TAB )
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}
" Remap \ to reverse search {{{
nnoremap \ ,
" }}}
" }}}
" vim: foldmethod=marker:foldlevel=0:
