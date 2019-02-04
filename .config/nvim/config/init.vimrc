call plug#begin()

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Convenience
Plug 'yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

" Language client integration
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Autocomplete async
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Directory navigation
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Vim theme coloring
Plug 'iCyMind/NeoSolarized'
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
