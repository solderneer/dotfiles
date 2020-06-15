" Statusline stuff
set laststatus=2

" Syntax highlighting and color
set background=dark
set t_Co=256
set termguicolors

syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

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

" nops for training
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

inoremap <C-j> <down>
inoremap <C-k> <up>
