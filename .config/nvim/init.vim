set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Settings {{{
" CtrlP {{{
:nmap <Leader>b :CtrlPBuffer<CR>
" }}}
" PHPDoc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>dc :call pdv#DocumentWithSnip()<CR>
" }}}


" UltiSnips {{{
let g:UltiSnipsListSnippets = "<F3>"
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips/", "UltiSnips/"]

" }}}
