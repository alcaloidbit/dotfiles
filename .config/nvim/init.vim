" Settings {{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Phpactor Omni-completion{{{
autocmd Filetype php setlocal omnifunc=phpactor#Complete
let g:phpactorOmniError = v:true
" }}}
" nvim-yarp {{{
" https://github.com/roxma/nvim-yarp#debugging
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
" }}}
" }}}
" Mappings {{{
" From the Book `Pratical Vim` {{{
" %% expands to the path of the active buffer ( eq : %:h<TAB )
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}
" Remap \ to reverse search {{{
nnoremap \ ,
" }}}
" Nvim-miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

map <leader>m <Plug>(miniyank-cycle)
map <leader>M <Plug>(miniyank-cycleback)

map <leader>c <Plug>(miniyank-tochar)
map <leader>l <Plug>(miniyank-toline)
map <leader>g <Plug>(miniyank-toblock)

" }}}
" }}}  
source ~/.vimrc
" vim: foldmethod=marker:foldlevel=0:
