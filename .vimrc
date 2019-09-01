" Settings {{{
" Leader Shortcut {{{
let mapleader=","   " leader is comma
" }}}
" Plugs mappings {{{
" PHPDoC {{{
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>dc :call pdv#DocumentWithSnip()<CR>
" }}}
" Ack mappings (from 'Vim pour les humains - http://vimebook.com {{{
let g:ackprg="ack -H --nocolor --nogroup --column"
" Place un marqueur et cherche
nmap <leader>j mA:Ack<space>
" Place un marqueur et cherche le mot sous le curseur 
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
" }}}
" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" CtrlP {{{
:nmap lb :CtrlPBuffer<CR>
" }}}
" CtrlPTag {{{
nnoremap <leader>. :CtrlPTag<CR>
" }}}
" NERDTree {{{
nnoremap <leader>e :OpenBookmark 
nnoremap <silent> <F9> :NERDTreeToggle<CR>
" close NERDTree if last buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" }}}
" Plugs Settings {{{
" Lightline {{{
    let g:lightline = {
           \ 'colorscheme': 'gruvbox',
            \ 'active'   : {
            \       'left': [ [ 'mode', 'paste' ],
            \                 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function' : {
            \ 'gitbranch': 'fugitive#head'
            \},
            \ 'separator'  : {'left': "\ue0b0", 'right':''},
            \ 'subseparator':{'left':'|', 'right':'|'}
            \}
" }}}
" PHPDoC {{{
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" }}}
" Enable Matchit plugin {{{
runtime macros/matchit.vim
" }}}
" UltiSnips {{{
let g:UltiSnipsListSnippets = "<F3>"
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips/", "UltiSnips/"]
" }}}
" VimWiki {{{
    let g:vimwiki_hl_headers = 1
    let wiki_1 = {}
    let wiki_1.path = '~/Documents/vimwiki/Main/'
    let wiki_1.index = 'index'


    let wiki_2 = {}
    let wiki_2.path = '~/Documents/vimwiki/Culture/'
    let wiki_2.index = 'Culture'

    let wiki_3 = {}
    let wiki_3.path = '~/Documents/vimwiki/Todo/'
    let wiki_3.index = 'index'

    let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

" }}}
" PHPComplete + Gutentags {{{
set omnifunc=syntaxcomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" setup vim tag file
set tags=tags;/
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END
" }}}
" Vundle  {{{
" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultiSnips'
Plugin 'tobyS/pdv'
" Plugin 'thaerkh/vim-workspace'
Plugin 'tobyS/vmustache'
Plugin 'honza/vim-snippets'
Plugin 'vimwiki/vimwiki'
Plugin 'vundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on
" }}}
" Ctrlp {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
" }}}
" }}}
" Colors {{{
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If using tmux 2.2 or later, you can remove the outermost $TMUX check and use
" tmux's 24-bit color support.
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < "https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

syntax on
" colorscheme gruvbox
colorscheme gruvbox
" }}}
" Local directories {{{
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
" }}}
" Options {{{
set autoindent  " Copy indent from last line when starting new line
set backspace=indent,eol,start
" set cursorline	        " highlight current line
set encoding=utf-8 nobomb   " BOM often causes troubles
set expandtab   " Tabs are spaces
set foldcolumn=0    " Column to show folds
set foldenable  " Enable folding
set foldlevel=0 " Close all folds by default
set foldlevelstart=10   " Start with fold level of 10
set foldmethod=indent   " Fold based on indent level
set foldnestmax=10  " Set max fold nesting level
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch    " Highlight searches
set ignorecase  " Ignore case of searches
set incsearch   "Highlight dynamically as pattern is typed
set laststatus=2  " Always show status line
set lazyredraw  " Don't redraw when we don't have to
set modeline
set modelines=1
set nocompatible
set noerrorbells    " Disable error bells
set noshowmode  " Don't show the current mode (lightline.vim takes care of that for us)
" set nowrap  " Do not wrap lines
set nu " Enable line numbers
set ruler   " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of windows
set shiftwidth=4  " The # of spaces for indenting
set shortmess=atI   " Don't show intro msg when starting vim
set showcmd " show command in bottom bar
set showmatch   " hightlight matching [{()}]
set showtabline=2   " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of windows
set smartcase   " Ignore 'ignorecase' if search pattern contains uppercase characters
set smarttab    " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=4   " Tab key results in 4 spaces
set title   " Show the filename in the window titlebar
set undodir=~/.vim/undodir
set undofile    " Persistent undo
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/doc/*,*/node_modules/*
set wildmenu    " Hitting TAB in command mode will show possible completions above command line
" set wildmode=list:longest   " Complete only until point of ambiguity
set winminheight=0  "Allow splits to be reduced to a single line
" }}}
" }}}
" Configuration {{{
augroup general_config
autocmd!
" Edit/Source vimrc {{{
:nmap <Leader>v :e $MYVIMRC
:nmap <Leader>s :source $MYVIMRC
" }}}
" <esc> is ;; {{{
inoremap ;; <esc>
" }}}
" Speed Up Scrolling {{{
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k
" }}}
" Faster split resizing (+,-) {{{
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif
" }}}
" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
map gj <C-W>j
map gk <C-W>k
map gh <C-W>h
map gl <C-W>l
" }}}
" Tab Navigation {{{
"nnoremap th :tabfirst<CR>
"nnoremap tk :tabnext<CR>
"nnoremap tj :tabprev<CR>
"nnoremap tl :tablast<CR>
"nnoremap tt :tabedit<Space>
"nnoremap tn :tabnext<Space>
"nnoremap tm :tabm<Space>
"nnoremap td :tabclose<CR>
"  Alternatively use
"  nnoremap th :tabnext<CR>
"  nnoremap tl :tabprev<CR>
"  nnoremap tn :tabnew<CR>
    " }}}
" Tabs Switching {{{
nmap <C-l> gt
nmap <C-h> gT
" }}}
" Sudo write (,W) {{{
noremap <leader>W :w !sudo tee %<CR>
" }}}
" Remap :W to :w {{{
command! W write
" }}}
" Clear last search (,n) {{{
map <silent> <Leader>n <Esc>:noh<CR>
" }}}
" Toggle Folds {{{
nnoremap <space> za
" }}}
" Open/Close folds by one level {{{
nnoremap <F4> zm
nnoremap <F5> zr
" }}}
" Open 1 fold level {{{
" nnoremap <F3> zr
" }}}
" Indent file {{{
map <F7> gg=G<C-o><C-o>
" }}}
" Netrw {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
" }}}
" Indentation based on filetype {{{
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType tpl setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType js  setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript  setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType smarty  setlocal shiftwidth=2 softtabstop=2 expandtab
" }}}
" Highlight last inserted text {{{
nnoremap gV `[v`]
" }}}
" Json syntax highlighting {{{
autocmd BufNewFile, BufRead * .json set ft=javascript
" }}}
" Relative numbers {{{
set relativenumber
:augroup numbertoggle
:autocmd!
:autocmd Bufenter,FocusGained,InsertLeave * set relativenumber
:autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END
" }}}
" Generate Tags on saving a php file {{{
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
" }}}
" Vim Sessions {{{
let g:sessions_dir = '~/.vim/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
" }}}
"}}}  
" Buffers {{{
augroup buffer_control
    autocmd!
" Buffer navigation (,,) (gb) (gB) {{{
map <Leader>, <C-^>
:nnoremap <C-n> :bnext<CR>
" }}}
augroup END
" List Buffers with nb, accept a new buffer arg [1] {{{
nnoremap <leader>b :ls<CR>:b<Space>
" }}}
" }}}
" vim: foldmethod=marker:foldlevel=0:
