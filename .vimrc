" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

  " Git
  Plug 'airblade/vim-gitgutter'
  
  " Convenience
  Plug 'yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'

  " Code Completion/Checking
  Plug 'scrooloose/syntastic'
  
  " Directory navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  
  " Editor config
  Plug 'editorconfig/editorconfig-vim'
  
  " Vim theme coloring
  Plug 'altercation/vim-colors-solarized'
  Plug 'taohexxx/lightline-solarized'

  " Docker
  Plug 'docker/docker'

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
set tabstop=2
set shiftwidth=2
set expandtab

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

