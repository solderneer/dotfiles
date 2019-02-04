" LIGHTLINE config

let g:lightline#languageclient#warnings = "\uf071 "
let g:lightline#languageclient#errors = "\uf05e "
let g:lightline#languageclient#ok = "\uf00c "

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

let g:lightline.component_expand = {
      \  'warning_count': 'lightline#languageclient#warnings',
      \  'error_count': 'lightline#languageclient#errors',
      \  'linter_ok': 'lightline#languageclient#ok',
      \ }

let g:lightline.component_type = {
      \  'warning_count': 'warning',
      \  'error_count': 'error',
      \  'linter_ok': 'left',
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
