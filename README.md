# indent.vim

Vim and Neovim indentation settings.

## Installation

Install with [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'chrisniael/indent.vim'
```

## Configurations

### Default indent character

```vim
let g:default_indent_char = 0
```

- 0: space (default)
- 1: tab

### Default indent width

```vim
let g:default_indent_width = 2
```

default value:

- 2: when indent character is space
- 4: when indent character is tab

### File types indented with 4 character tabs

```vim
let g:indent_tab_4w_filetypes = ["go", "cpp"]
```

### File types indented with 8 character tabs

```vim
let g:indent_tab_8w_filetypes = ["c", "cpp"]
```

### File types indented with 2 character spaces

```vim
let g:indent_space_2w_filetypes = ["c", "cpp"]
```

### File types indented with 4 character spaces

```vim
let g:indent_space_4w_filetypes = ["c", "cpp"]
```
