" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'editorconfig/editorconfig-vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'taohexxx/lightline-solarized'

  " ignore these on older versions of vim
  if v:version >= 703
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'jamessan/vim-gnupg'
  endif
  if v:version >= 704
    Plug 'vim-pandoc/vim-pandoc-syntax'
  endif

  call plug#end()
endif

set laststatus=2
set background=dark

syntax enable
colorscheme solarized

" Setting backspace settings to be more convinient
set backspace=indent,eol,start

" Configuring lightline for solarized
let g:lightline = {
	\ 'colorscheme': 'lightline_solarized',
	\ }

" turn absolute line numbers on
:set number
:set nu

" Clear sign column color
highlight clear SignColumn

" Indent settings
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
