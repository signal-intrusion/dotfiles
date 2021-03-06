set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-haml'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'mustache/vim-mode'
Plugin 'tpope/vim-surround'
Plugin 'Shutnik/jshint2.vim'
Plugin 'reedes/vim-pencil'

"Syntax
Plugin 'vim-ruby/vim-ruby'
Plugin 'evidens/vim-twig.git'
Plugin 'aaronj1336/underscore-templates.vim.git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-rails'

"snippets and autocomplete
Plugin 'tpope/vim-ragtag'
Plugin 'firegoby/SASS-Snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'Valloric/YouCompleteMe'

Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


autocmd VimEnter * NERDTree

" ------ colors lines and numbers ------ "

set t_Co=256
syntax on
set lines
set number
set showcmd
set autoindent
set pastetoggle=<F7>
let mapleader = ","
let g:mapleader = ","

nmap <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
let g:NERDSpaceDelims = 1

" Move Lines Up/Down
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Tabs and Spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
set list listchars=tab:»·,trail:· " detect trailing whitespace
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  set guicursor+=i:blinkwait0
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  set guicursor+=i:blinkwait0
endif

"let g:airline_theme="sol"

let g:pencil#wrapModeDefault = 'soft'   " or 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" snippets scope filetypes
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['twig'] = 'twig,html'

" Remap snippets and ycm


let g:ycm_key_list_select_completion = ['<C-s>', '<C-Space>']
let g:ycm_key_list_previous = ['<C-n>']

imap <Tab> <Plug>snipMateNextOrTrigger
smap <Tab> <Plug>snipMateNextOrTrigger

" jshint

let jshint2_save = 1
