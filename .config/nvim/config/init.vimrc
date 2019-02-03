call plug#begin()

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

call plug#end()
