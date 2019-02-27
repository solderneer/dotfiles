call plug#begin()

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Convenience
Plug 'yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

" Lightline plugins
Plug 'solderneer/lightline-languageclient'

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
Plug 'hankchiutw/flutter-reload.vim'

" Mustahe and handlebars support
Plug 'mustache/vim-mustache-handlebars'

call plug#end()
