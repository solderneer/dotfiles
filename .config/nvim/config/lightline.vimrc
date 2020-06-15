let g:lightline#coc#indicator_warnings = "\uf071 "
let g:lightline#coc#indicator_errors = "\uf05e "
let g:lightline#coc#indicator_ok = "\uf00c "

" LIGHTLINE config
let g:lightline = {
 \ 'colorscheme': 'dracula',
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

let g:lightline.active = {
      \ 'right': [
      \ [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \ [ 'coc_status'],
      \ [ 'lineinfo' ],
      \ [ 'percent' ],
      \ [ 'fileformat', 'fileencoding', 'filetype' ]],
      \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'fugitive', 'readonly', 'filename', 'modified' ]] }

call lightline#coc#register()
