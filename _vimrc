set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"Personal Settings.
"More to be added soon.
execute pathogen#infect()
filetype plugin indent on
syntax enable

"Set the status line options. Make it show more information.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
"[POS=%1,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
 
"Set Color Scheme and Font Options
colorscheme kolor
set guifont=Consolas:h12 

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
let mapleader = ","

"Set line no, buffer, search, highlight, autoindent and more.
set t_Co=256
set nu
set hidden
set ignorecase
set smartcase
set showmatch
set autoindent
set ruler
set vb
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4 " number of spaces per tab
set softtabstop=4 " number of spaces when editing
set cursorline
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when needed.
set incsearch " search as characters are entered
set hlsearch "highlight matches
set encoding=utf-8
set relativenumber


nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap jk <esc>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap B ^            
nnoremap E $          
nnoremap $ <nop>        
nnoremap ^ <nop>
nnoremap <leader>vi <C-w><C-v><C-l>:e $MYVIMRC<cr>
vnoremap <up> <nop>
vnoremap <right> <nop>

set colorcolumn=85
setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#CompleteParamsInfo 


