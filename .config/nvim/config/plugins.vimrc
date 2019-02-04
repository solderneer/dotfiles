" Deoplete config
let g:deoplete#enable_at_startup = 1

" LanguageClient config
set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'dart': ['~/.pub-cache/bin/dart_language_server'],
      \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> lr :call LanguageClient#textDocument_rename()<CR>

" Language autoformatting config
let g:rustfmt_autosave = 1
let g:dart_format_on_save = 1

" Fix for vue syntax highlighting
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
