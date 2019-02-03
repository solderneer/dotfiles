" ALE pre load config
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls']}

" Language autoformatting config
let g:rustfmt_autosave = 1
let g:dart_format_on_save = 1

" Fix for vue syntax highlighting
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
