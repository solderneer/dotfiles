" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" ALE pre load config
let g:ale_completion_enabled = 1

" declare plugins
silent! if plug#begin()

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  " Convenience
  Plug 'yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'

  " Code Syntax Checking
  " Plug 'scrooloose/syntastic'
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale'

  " Code Completion using YouCompleteMe
  Plug 'valloric/youcompleteme'
    
  " Directory navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  
  " Editor config
  Plug 'editorconfig/editorconfig-vim'
  
  " Vim theme coloring
  Plug 'altercation/vim-colors-solarized'
  Plug 'taohexxx/lightline-solarized'

  " LANGUAGE SPECIFIC "
  " Docker
  Plug 'docker/docker'
  
  " Javascript Support
  Plug 'pangloss/vim-javascript'

  " Rust Support
  Plug 'rust-lang/rust.vim'

  " Vue Support
  Plug 'posva/vim-vue'

  " Dart Support
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'reisub0/hot-reload.vim'

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

" Configuring lightline for ALE
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'gitbranch': 'fugitive#head',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 
      \ 'right': [
      \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \ [ 'lineinfo' ], 
      \ [ 'percent' ], 
      \ [ 'fileformat', 'fileencoding', 'filetype' ]], 
      \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]] }

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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Language autoformatting config
let g:rustfmt_autosave = 1
let dart_format_on_save = 1

" Fix for vue syntax highlighting
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
