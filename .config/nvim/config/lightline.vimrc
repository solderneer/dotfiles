" LIGHTLINE config

let g:indicator_checking = "\uf110 "
let g:indicator_warnings = "\uf071 "
let g:indicator_errors = "\uf05e "
let g:indicator_ok = "\uf00c "

let g:lightline = {
    \ 'colorscheme': 'lightline_solarized',
		\ 'component': {
		\   'lineinfo': ' %3l:%-2v',
		\ },
		\ 'component_function': {
		\   'readonly': 'LightlineReadonly',
		\   'fugitive': 'LightlineFugitive',
		\ },
		\ 'separator': { 'left': '', 'right': '' },
		\ 'subseparator': { 'left': '', 'right': '' }
\ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LC_warning_count()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'W'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:indicator_warnings . '%d', count) : ''
endfunction

function! LC_error_count()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && dict['type'] == 'E'})
  let count = len(current_buf_diagnostics)
  return count > 0 && g:LanguageClient_loaded ? printf(g:indicator_errors . '%d', count) : ''
endfunction

function! LC_ok()
  let current_buf_number = bufnr('%')
  let qflist = getqflist()
  let current_buf_diagnostics = filter(qflist, {index, dict -> dict['bufnr'] == current_buf_number && (dict['type'] == 'E' || dict['type'] == 'W')})
  let count = len(current_buf_diagnostics)
  return count == 0 ? g:indicator_ok : ''
endfunction

let g:lightline.component_expand = {
      \  'warning_count': 'LC_warning_count',
      \  'error_count': 'LC_error_count',
      \  'linter_ok': 'LC_ok',
      \ }

let g:lightline.component_type = {
      \     'warning_count': 'warning',
      \     'error_count': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = {
      \ 'right': [
      \ [ 'error_count', 'warning_count', 'linter_ok' ],
      \ [ 'lineinfo' ],
      \ [ 'percent' ],
      \ [ 'fileformat', 'fileencoding', 'filetype' ]],
      \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'fugitive', 'readonly', 'filename', 'modified' ]] }

autocmd User LanguageClientDiagnosticsChanged call lightline#update()
