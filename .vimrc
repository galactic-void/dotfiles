"
" ~/.vimrc 		-> linux $VIM/.vimrc	-> win
"
" Archivo de configuraci�n del editor VIM (er mejo!)
"
" Trato que funcione tanto en WIN (con gvim) como en LINUX (vim y gvim)
" Configuraci�n ontenida de W0ng -> https://github.com/w0ng
"
" Vicente Gimeno Morales - E7 Version 2.8 - 22 ene 2015
"======================================================================#
"
" Compability {{{
" -----------------------------------------------------------------------------
"
set nocompatible          " use vim defaults instead of vi
set encoding=utf-8        " always encode in utf

"}}}
" Vim Plugins {{{
" -----------------------------------------------------------------------------
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins
" :PluginUpdate     - Update Plugins
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " Put your non-Plugin stuff after this line
  "Plugin 'Shougo/neocomplete'                    " Automatic keyword completion
  "Plugin 'Shougo/unite.vim'                      " Find files and buffers using ag
  "Plugin 'Shougo/vimfiler.vim'                   " File Explorer :VimFiler
  Plugin 'jlanzarotta/bufexplorer'                " Buffer Explorer :BufExplore
  Plugin 'godlygeek/tabular'                      " Text alignment
  Plugin 'majutsushi/tagbar'                      " Display tags in a window
  "Plugin 'scrooloose/syntastic'                  " Syntax checking on write
  Plugin 'tpope/vim-fugitive'                     " Git wrapper
  Plugin 'tpope/vim-surround'                     " Manipulate quotes and brackets
  Plugin 'bling/vim-airline'                      " Pretty statusbar
  Plugin 'terryma/vim-multiple-cursors'           " Multiple cursors work
  Plugin 'edkolev/promptline.vim'                 " Prompt generator for bash
  Plugin 'altercation/vim-colors-solarized.git'   " Solarized theme

  " All of your Plugins must be added before the following line
call vundle#end()                     " required

if has("win32")
  set runtimepath+=~/.vim
endif

"}}}
" Settings {{{
" -----------------------------------------------------------------------------

" File detection
filetype on
filetype plugin indent on
syntax on

" General
set backspace=2           " enable <BS> for everything
set colorcolumn=80        " visual indicator of column
set number	              " Show line numbers
set completeopt=longest,menuone   " Autocompletion options
set complete=.,w,b,u,t,i,d        " autocomplete options (:help 'complete')
set hidden                " hide when switching buffers, don't unload
set laststatus=2          " always show status line
set lazyredraw            " don't update screen when executing macros
set mouse=a               " enable mouse in all modes
set noshowmode            " don't show mode, since I'm already using airline
set nowrap                " disable word wrap
set showbreak="+++ " 	    " String to show with wrap lines
set number                " show line numbers
set showcmd               " show command on last line of screen
set showmatch             " show bracket matches
set spelllang=es 	        " spell
set spellfile=~/.vim/spell/es.utf-8.add
set textwidth=0           " don't break lines after some maximum width
set ttyfast               " increase chars sent to screen for redrawing
"set ttyscroll=3           " limit lines to scroll to speed up display
set title                 " use filename in window title
set wildmenu              " enhanced cmd line completion
set wildchar=<TAB>	      " key for line completion
set noerrorbells          " no error sound
set splitright	          " Split new buffer at right

" Folding
set foldignore=           " don't ignore anything when folding
set foldlevelstart=99     " no folds closed on open
set foldmethod=marker     " collapse code using markers
set foldnestmax=1         " limit max folds for indent and syntax methods

" Tabs
set autoindent            " copy indent from previous line
set expandtab             " replace tabs with spaces
set shiftwidth=2          " spaces for autoindenting
set smarttab              " <BS> removes shiftwidth worth of spaces
set softtabstop=2         " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2             " spaces for <Tab>

" Searches
set hlsearch              " highlight search results
set incsearch             " search whilst typing
set ignorecase            " case insensitive searching
set smartcase             " override ignorecase if upper case typed
set more	                " Stop in list

" Status bar -> Replace with vim-airplane plugin
set laststatus=2          " show ever
set showmode              " show mode
set showcmd               " show cmd
set ruler                 " show cursor line number
set shm=atI               " cut large messages

" Colours
set t_Co=256
if &term == "xterm"
  set background=dark
  colorscheme base16-default
else
  " Theme setting.
  " Two principal themes for dark and light background
  " Function ToggleColours
  " See comments in theme
  let g:hybrid_use_Xresources = 1
  set background=dark
  colorscheme hybrid_e7
endif

" gVim
if has('gui_running')
  if has("win32")
    set guifont=Lucida_Console:h8
    set lines=40					      	" N� lines
    set columns=90			      		" N� columns
  else
    set guifont=Inconsolata\ for\ Powerline\ 10
  endif
    set guioptions-=m               " remove menu
    set guioptions-=T               " remove toolbar
    set guioptions-=r               " remove right scrollbar
    set guioptions-=b               " remove bottom scrollbar
    set guioptions-=L               " remove left scrollbar
    set guicursor+=a:block-blinkon0 " use solid block cursor
    " Paste from PRIMARY and CLIPBOARD
    "inoremap <silent> <M-v> <Esc>"+p`]a
    "inoremap <silent> <S-Insert> <Esc>"*p`]a
endif

" vimdiff
if &diff
    set diffopt=filler,foldcolumn:0
endif

"}}}
" Mappings {{{
" -----------------------------------------------------------------------------

" Fixes linux console keys
" "od -a" and get the code
" "^[" is <ESC> at vim
map <ESC>Ob <C-Down>
map <ESC>Oc <C-Right>
map <ESC>Od <C-Left>
map <ESC>Oa <C-Up>
map <C-@> <C-Space>
map! <ESC>Ob <C-Down>
map!<ESC>Oc <C-Right>
map! <ESC>Od <C-Left>
map! <ESC>Oa <C-Up>
map! <C-@> <C-Space>

" Map leader
let mapleader = ','

" Toggle hlsearh for results
nnoremap <leader><leader> :nohlsearch<CR>
" Increment on cursor in new line
nnoremap <leader>a  qaYp<C-A>q1@a
" Open buff explorer
nnoremap <leader>b :BufExplorer<CR>
" Open diff vertical
nnoremap <leader>d :vertical diffsplit<CR>
" Open file browser
nnoremap <leader>f :Explore<CR>

" Buffer selection
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader><Tab> :b#<CR>
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <M-Right> :bn<CR>
nnoremap <M-Left> :bp<CR>
nnoremap <M-n> :bn<CR>
nnoremap <M-p> :bp<CR>

" Spell checking
nnoremap <leader>s :set spell!<CR>
" Prepare tabularize
nmap <Leader>t :'<,'> Tabularize /
vmap <Leader>t :Tabularize /
" vsplit
nnoremap <leader>v :vsplit<CR>
" Edit .vimrc
nnoremap <leader>vi :e $HOME/.vimrc<CR>
nnoremap <leader>vr :source $HOME/.vimrc<CR>
" Search for trailing spaces
nnoremap <leader>w :%s/\s\+$//gc<CR>

" Next window
nnoremap <tab> <C-W>w
" Togle fold
nnoremap <space> za
" Search command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Repace (:help substitute) (:help regular)
nnoremap <C-R> :%s///gic

" Autocomplete with Ctrl+space o C-N
inoremap <C-F> <C-X><C-F>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Paste mode for terminal
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Toggle colors
noremap <F4> :call ToggleColours()<CR>
" Ctags Bar
noremap <F9> :TagbarToggle<CR>

" Run compiler
nnoremap <silent> <F5> :call ExecCompiler()<CR>

"}}}
" Abreviations {{{
" -----------------------------------------------------------------------------

" Time
iab _datetime <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab _time <C-R>=strftime("%H:%M")<CR>
iab _date <C-R>=strftime("%d %b %Y")<CR>

" Personal
iab _name Vicente Gimeno Morales - Electro7
iab _mail vgimeno@grupocener.com

" Heads
iab _ct #-----------------------------------------------------------------------------#<ESC>ki
iab _cc // <CR>//----------------------------------------------------------------------------<ESC>ki

" HOME
iab _home ~/

"}}}
" Plugin Settings {{{
" -----------------------------------------------------------------------------
"  vim-airline
let g:airline_inactive_collapse = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
if has("gui_win32") || &term == "xterm"
  let g:airline_powerline_fonts = 0
  let g:airline_symbols = {}
  let g:airline_left_sep = ''
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_sep = ''
  let g:airline_theme = 'air_e7'
else
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'air_e7'
endif

" Promptline
" \'b': [ promptline#slices#host(), promptline#slices#user() ],
let g:promptline_preset = {
        \'b': [ promptline#slices#cwd() ],
        \'c': [ promptline#slices#vcs_branch() ],
        \'z': [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'air_e7'

"}}}
" Autocommands {{{
" -----------------------------------------------------------------------------

" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Indent rules
autocmd FileType c
      \ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp,java,javascript,json,markdown,php,python
      \ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType markdown setlocal textwidth=79
autocmd FileType prg
      \ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 cindent

" Txt
autocmd FileType text setlocal textwidth=79 wrap

" Folding rules
autocmd FileType c,cpp,java,prg setlocal foldmethod=syntax foldnestmax=5
autocmd FileType css,html,htmldjango,xhtml
      \ setlocal foldmethod=indent foldnestmax=20

" Set correct markdown extensions
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
            \ if &ft =~# '^\%(conf\|modula2\)$' |
            \   set ft=markdown |
            \ else |
            \   setf markdown |
            \ endif

"Set filetype for prg
autocmd BufNewFile,BufRead *.prg,*.dev set ft=prg

"}}}
" Functions {{{
" -----------------------------------------------------------------------------

" Toggle Colours
function! ToggleColours()
  if &background  == 'dark'
    set background=light
    let g:solarized_bold=0
    colorscheme solarized
    AirlineTheme base16
  else
    set background=dark
    let g:hybrid_use_Xresources = 1
    colorscheme hybrid_e7
    AirlineTheme air_e7
  endif

  " Reconfigure term colors
  if !has('gui_running')
    if &background == 'light'
      if filereadable($HOME."/.config/termcolours/light.sh")
        execute "silent !/bin/sh ".$HOME."/.config/termcolours/light.sh"
      endif
    else
      if filereadable($HOME."/.config/termcolours/dark.sh")
        execute "silent !/bin/sh ".$HOME."/.config/termcolours/dark.sh"
      endif
    endif
  endif

endfunction

" Open compiler for filetype
function! ExecCompiler()

    " Autom
    if &ft == "prg"
      if filereadable(getcwd() . "/siga.prg")
        if has("win32")
          :!start c:\winsiga\ucsiga\ucWin.exe "%:p:h\siga.prg"
        else
          :!/root/siga/siga "%:p:h/siga.prg"
        endif
      else
        if has("win32")
          :!start c:\winsiga\ucsiga\ucWin.exe "%:p"
        else
          :!/root/siga/siga "%:p"
        endif
      endif
    endif

endfunction

"}}}
