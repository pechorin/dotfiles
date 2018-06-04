" == This is my primary dev environment.
"
" - leader key mapped to ,
" - plugins managment via VimPlug
" - support unix-like hotkeys ctrl-a/e/k for command line
" - open tab via 'CMD+t'
" - '<leader>c' to comment/uncomment line

" == External Dependencies
"   brew install ripgrep
"   gem install ripper_tags
"
" == CtrlP
" <leader>m -> file browser
" <leader>b -> buffer browser
" <leader>n -> current buffer tag browser

set nocompatible " be iMproved
filetype off

call plug#begin('~/.vim/bundle') " vim plug
" === Common plugins
Plug 'scrooloose/nerdtree'
" Plug 'kana/vim-smartinput'
Plug 'tpope/vim-commentary' " comments via <leader>-c
Plug 'ervandew/supertab'    " completion with tab
Plug 'vim-scripts/CursorLineCurrentWindow' " each window has separate cursor
Plug 'tpope/vim-surround'  
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'  
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'  " fast grep via rust
Plug 'racer-rust/vim-racer' 
Plug 'junegunn/vim-easy-align'
Plug 'eugen0329/vim-esearch' " serch in project and nerdtree with <leader>ff
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'

" === Language support
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'mitsuhiko/jinja2'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'kchmck/vim-coffee-script'

" === Tags support
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" === Colorschemes
Plug 'ChrisKempson/Tomorrow-Theme', { 'rtp' : 'vim' }
Plug 'thinkpixellab/flatland', {'rtp' : 'Vim/'}
Plug 'hzchirs/vim-material'
Plug 'nanotech/jellybeans.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'nightsense/office'

call plug#end()

filetype plugin indent on

" === Configurations
" set nonumber         " display line numbers
" set nonumber       " use <LINE_NUMBER>G to jump to <LINE_NUMBER> line
set showmode       " always show what mode we're currently editing in

set encoding=utf-8
set fileencodings=utf-8,cp1251
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

set wildmenu       " display command-line autocomplete variants
set wildmode=full
set wildignore+=.hg,.git,.svn,*.DS_Store,*.pyc

set title          " change the terminal's title

set visualbell     " Use visual bell instead of beeping

set scrolloff=999  " makes vim centered like a iA Writer
set showtabline=1  " display tabline only if where is more then one tab

set linebreak      "

set autoindent     " always set autoindenting on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set cursorline
set splitbelow
set splitright
set mousehide      " Hide the mouse when typing text
set laststatus=2

set hidden         " this allows to edit several files in the same time without having to save them

if has("linebreak")
  let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

set incsearch      " show search matches as you type
set ignorecase     " ignore case when searching
set smartcase
set showmatch      " set show matching parenthesis
set gdefault       " all matches in a line are substituted instead of one.

" === Don't skip wrap lines
noremap j gj
noremap k gk

set history=1000    " store lots of :cmdline history
set undolevels=1000 " use many muchos levels of undo
set nobackup        " no backup files
set nowritebackup   " only in case you don't want a backup file while editing
set noswapfile      " no swap files

" === GUI
syntax on
set guifont=Monaco:h14
set guioptions-=T  " remove gui toolbar
set guioptions-=l  " remove left-hand scrollbar
set guioptions-=L  " remove left-hand scrollbar
" set guioptions+=a  " automatically add selected text in the VISUAL mode to system copy-paste buffer
 set guioptions-=e  " remove gui tabs

set background=light
:silent! colorscheme=github

" === NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

" === leader key
let mapleader=","

" === Ctrlp config
let g:ctrlp_map = '<leader>m' " remap ctrlp call to <leader>m
let g:ctrlp_dotfiles = 1      " don't scan .dot-folders
let g:ctrlp_user_command = 'rg %s -i --files --no-heading'
let g:ctrlp_use_caching = 0
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>n :CtrlPBufTag<CR>
nmap <leader>v :CtrlPTag<CR>

" ctrlp funky
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_ruby_rake_words = 1

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" === commentary.vim
" just use <leader>c for comment/uncomment
nmap <leader>c <Plug>CommentaryLine
vmap <leader>c <Plug>Commentary

" === tagbar.vim
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1

" https://github.com/r00k/dotfiles/blob/master/vimrc
" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
" Disable K looking man stuff up
" map K <Nop>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" Ctags for Markdown
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

" hamljs
au BufNewFile,BufRead *.lmx set filetype=haml

" some custome staff
" autocmd FocusLost * :wa " Save on losing focus

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore, backbone, angularjs'

" js tab == 4 spaces
au FileType javascript setl sw=4 sw=4 sts=4

" markdown
let g:vim_markdown_folding_disabled=1

" vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "dispatch"

" lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" esearch
let g:esearch = { 'adapter': 'rg', 'backend': 'vim8', 'out': 'qflist' }

" Filetypes detection
au BufNewFile,BufRead *.js.erb set filetype=javascript
au BufNewFile,BufRead *.rs     set filetype=rust
au BufNewFile,BufRead *.yml.j2 set filetype=yaml
au BufNewFile,BufRead *.cjsx   set filetype=coffee

" use rg
set grepprg=rg\ --color=never

" tags
:hi CursorLine cterm=NONE

"
autocmd FileType yaml setlocal cursorcolumn
autocmd FileType eruby.yaml setlocal cursorcolumn

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Tags settings
let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_executable_ruby = 'ruby-tags'

" Tagbar settings
map <leader>x :TagbarToggle<CR> 

if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif
