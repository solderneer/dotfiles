set laststatus=2
set background=dark

syntax enable
colorscheme solarized

" Setting backspace settings to be more convinient
set backspace=indent,eol,start

" turn absolute line numbers on
:set number
:set nu

" Clear sign column color
highlight clear SignColumn

" Indent settings
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

set ruler		" show the cursor position all the time
set cursorline

set showcmd		" display incomplete commands

