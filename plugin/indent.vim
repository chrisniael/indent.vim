" indent char，0: space, 1: tab
let g:default_indent_char = get(g:, 'default_indent_char', 0)

" the num of indent char
if !exists('g:default_indent_width')
  if g:default_indent_char == 0
    " indent char is space
    let g:default_indent_width = 2
  else
    " indent char is tab
    let g:default_indent_width = 4
  endif
endif

" filetypes that use tab with 4 width as indent char
let g:indent_tab_4w_filetypes = get(g:, 'indent_tab_4w_filetypes', [])

" filetypes that use tab with 8 width as indent char
let g:indent_tab_8w_filetypes = get(g:, 'indent_tab_8w_filetypes', [])

" filetypes that use 2 space as indent char
let g:indent_space_2w_filetypes= get(g:, 'indent_space_2w_filetypes', [])

" filetypes that use 4 space as indent char
let g:indent_space_4w_filetypes = get(g:, 'indent_space_4w_filetypes', [])

set autoindent
set smartindent
set smarttab
set softtabstop=0

if g:default_indent_char == 0
  set expandtab
else
  set noexpandtab
endif

let &tabstop = g:default_indent_width
let &shiftwidth = g:default_indent_width

" 设置缩进字符
function! s:set_files_indent(filetype_list, mode, width)
  if len(a:filetype_list) == 0
    return
  endif

  let l:i = 0
  let l:file_types_str = ""
  for lang in a:filetype_list
    if l:i == 0
      let l:file_types_str = lang
    else
      let l:file_types_str = l:file_types_str. "," . lang
    endif
    let l:i = l:i + 1
  endfor

  " a:mode, 0: 空格, !0: Tab
  let l:mode = "expandtab"
  if a:mode != 0
    let l:mode = "noexpandtab"
  endif

  execute "autocmd FileType " . l:file_types_str. " setlocal " . l:mode . " tabstop=" . a:width . " shiftwidth=" . a:width
endfunction

call s:set_files_indent(g:indent_tab_4w_filetypes, 1, 4)
call s:set_files_indent(g:indent_tab_8w_filetypes, 1, 8)
call s:set_files_indent(g:indent_space_2w_filetypes, 0, 2)
call s:set_files_indent(g:indent_space_4w_filetypes, 0, 4)
