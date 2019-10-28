" Settings {{{
" Leader Shortcut {{{
let mapleader=","   " leader is comma
" }}}
" Plugs mappings {{{
" Tagbar {{{
nnoremap <F8> :TagbarToggle<CR>
" }}}
" CtrlP {{{
" :nnoremap lb :CtrlPBuffer<CR>
nnoremap lb :Buffers<CR>
" }}}
" CtrlPTag {{{
nnoremap <leader>. :CtrlPTag<CR>
" }}}
" Instant-markdown {{{
nnoremap <leader>md :InstantMarkdownPreview<CR>
" }}}
" Ncm2 {{{
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  :on_completg': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })
" }}}
" NERDTree {{{
nnoremap <leader>e :OpenBookmark<space>
nnoremap <leader>nf :NERDTreeFind<CR> 

nnoremap <silent> <F9> :NERDTreeToggle<CR>
" close NERDTree if last buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" rip-grep {{{
nnoremap <leader>rg :Rg<space>
nnoremap <leader>RG :exec "Rg ".expand("<cword>")<cr>

autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}
" Ferret {{{
" Instead of <leader>a, use <leader>fa
nmap <leader>fa <Plug>(FerretAck)
" Instead of <leader>l, use <leader>fl
nmap <leader>fl <Plug>(FerretAck)
" Instead of <leader>s, use <leader>fs
nmap <leader>fs <Plug>(FerretAck)
" Instead of <leader>r, use <leader>fu
nmap <leader>fu <Plug>(FerretAck)
" }}}
" }}} 
" Plugs Settings {{{
" NERDTree {{{
let NERDTreeIgnore=['node_modules', 
                    \ 'package-lock.json',
                    \ 'package.json',
                    \ 'postcss.config.js',
                    \ 'webpack.config.js' ]
" }}}
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
" Enable Matchit plugin {{{
runtime macros/matchit.vim
" }}}
" UltiSnips {{{
let g:UltiSnipsListSnippets = "<F3>"
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips/", "UltiSnips/"]
" }}}
" VimWiki {{{
" vimwiki markdown support {{{
    let g:vimwiki_ext2syntax = {  '.md': 'markdown', 
                                \ '.markdowon': 'markdown', 
                                \ '.mkd': 'markdown', 
                                \ '.mdown' :'markdown'}

   let g:instant_markdown_autostart = 0
" }}}
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

    let wiki_4 = {}
    let wiki_4.path = '~/Documents/wikimd/'
    let wiki_4.syntax = 'markdown'
    let wiki_4.ext = '.md'
    let wiki_4.index = 'index'

    let wiki_5 = {}
    let wiki_5.path = '~/.vim/mappings/'
    let wiki_5.syntax = 'markdown'
    let wiki_5.ext = '.md'
    let wiki_5.index = 'index'

    let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4, wiki_5]

" }}}
" Gutentags {{{
let g:gutentags_trace=0
" let g:gutentags_ctags_exclude=["timpope/*"]
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END
" }}}
" Fzf {{{
set rtp+=~/.fzf
" }}}
" Vundle Manager  {{{
" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'SirVer/ultiSnips'
Plugin 'StanAngeloff/php.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bfredl/nvim-miniyank'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'haya14busa/is.vim'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
" Modify * to also work with visual selection
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-bbye'
Plugin 'morhetz/gruvbox'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-tern'
Plugin 'neomake/neomake'
Plugin 'phpactor/ncm2-phpactor'
Plugin 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
Plugin 'plasticboy/vim-markdown'
Plugin 'roxma/nvim-yarp'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'vundleVim/Vundle.vim'
Plugin 'wincent/ferret'
call vundle#end()
filetype plugin indent on
" }}}
" Ctrlp {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
" }}}
" Bbye {{{
set runtimepath^=~/.vim/bundle/bbye
" }}}
" Ncm2 {{{
" enable ncm2 for all buffers 
autocmd BufEnter * call ncm2#enable_for_buffer()
" Important\: :help Ncm2PopupOpen for more Information
set completeopt=noinsert,menuone,noselect
" }}}
" PHPactor {{{
" Include use statement
nnoremap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nnoremap <Leader>mm :call phpactor#ContextMenu()<CR>

" Goto definition of class or class member under the cursor
nnoremap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor 
nnoremap <leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nnoremap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nnoremap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nnoremap <silent><leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vnoremap <silent><leader>ee :<C-u>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vnoremap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
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
" map Ctrl-f to fzf :Files
nnoremap <C-f> :Files<Cr>
" Pwd {{{
nnoremap <leader>pwd :pwd<Cr>
" }}}
" Press * to search for the term under the cursor or a visual selection an 
" then press a key below to replace all instances of it in the current file.
nnoremap <leader>r :%s///g<Left><Left>
" Confirm each substition.
nnoremap <leader>rc :%s///gc<Left><Left><Left>
" Report the number of matches, do not actually substitute. 
nnoremap <leader>rn :%s///gcn<Left><Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that 
" by pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///g<Left><Left><Left>

" Save/Quit vim moppings {{{
noremap <leader>w :w<CR>
noremap <leader>qq :qa!<CR>
noremap <leader>wq :wqa<CR>
" }}}
" Find files by filename {{{
noremap <leader>fd :find<space>
" }}}
" Edit/Source vimrc {{{
nnoremap <Leader>vi :e ~/.vimrc<Cr>
nnoremap <Leader>so :source ~/.vimrc<CR>
" }}}
" <esc> is ;; {{{
inoremap ;; <esc>
" }}}
" <esc> exit terminal-mode {{{
tnoremap <Esc> <C-\><C-n>
" }}}
" Speed Up Scrolling {{{
nnoremap J 5j
nnoremap K 5k
xnoremap J 5j
xnoremap K 5k
" }}}
" Splitting {{{
noremap <leader>vs :vsplit<CR>
noremap <leader>sp :split<CR>
noremap <leader>cl :close<CR>
" }}}
" Faster Split resizing (+,-) {{{
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif
" }}}
" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
noremap gj <C-W>j
noremap gk <C-W>k
noremap gh <C-W>h
noremap gl <C-W>l
" }}}
" Tab Navigation {{{
"nnoremap th :tabfirst<CR>
"nnoremap tk :tabnext<CR>
"nnoremap tj :tabprev<CR>
"nnoremap tl :tablast<CR>
"nnoremap tt :tabedit<Space>
"nnoremap tn :tabnext<Space>
"nnoremap tm :tabm<Space>
nnoremap tc :tabclose<CR>
nnoremap te :tabedit<CR>
nnoremap tn :tabnext<CR>
noremap tp :tabprev<CR>
" }}}
" Tabs Switching {{{
nnoremap <C-l> gt
nnoremap <C-h> gT
" }}}
" Sudo write (,W) {{{
noremap <leader>W :w !sudo tee %<CR>
" }}}
" Remap :W to :w {{{
command! W write
" }}}
" Clear last search (,n) {{{
noremap <silent> <nowait> <Leader>n <Esc>:noh<CR>
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
noremap <F7> gg=G<C-o><C-o>
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
" Vim Sessions {{{
let g:sessions_dir = '~/.vim/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
" {{{ Save all open files, write this:session
nnoremap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/.vim/vim-sessions/
" }}}
" }}}
"}}}  
" Buffers {{{
" Create a new empty buffer
nnoremap <leader>ne :enew<cr>
nnoremap <leader>vne :vnew<cr>
augroup buffer_control
    autocmd!
" Buffer navigation (,,) (gb) (gB) {{{
noremap <Leader>, <C-^>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Close Buffers Properly {{{
nnoremap <Leader>q :Bdelete<CR>
" }}}
" }}}
augroup END
" List Buffers with nb, accept a new buffer arg [1] {{{
nnoremap <leader>b :ls<CR>:b<Space>
" }}}
" }}}
" vim: foldmethod=marker:foldlevel=0:
