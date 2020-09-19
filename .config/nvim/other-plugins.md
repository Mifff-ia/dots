# Other Plugins I've Used
Keeping them here cause my vimrc was getting cluttered. With some of the config
I used with them.

## Language Plugins

### Common Lisp

```vim
Plug 'vlime/vlime', {'rtp': 'vim/'}
```

### Latex

```vim
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
```

## Wiki
Can't organize myself for the life of me so this has been staying unused

```vim
Plug 'fcpg/vim-waikiki'
```

## Quality of life plugins

### FZF

```vim
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'     " Fuzzy fast searching for fun and profit.
```

### vim vinegar
Makes netrw more usable, but I don't use netrw anymore so eh.

```vim
Plug 'tpope/vim-vinegar'   " Netrw things
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
```

### vim eunuch
Unix command running from vim made more seamless

```vim
Plug 'tpope/vim-eunuch'     " Vim sugar for unix commands.
```

## Aesthetic Plugins

### vim crystalline
Statusline plugin configured similarly to `statusline`

```vim
Plug 'rbong/vim-crystalline'
```

### wal.vim
A colorscheme that uses the terminal colors, intended for use with pywal. I
don't use this anymore cause base16-themes look better out of the box.

```vim
Plug 'dylanaraps/wal.vim'
```

### Goyo and Limelight
A cute distraction free writing plugin pair.

```vim
Plug 'junegunn/goyo.vim'       " Distraction free mode.
Plug 'junegunn/limelight.vim'  " Dim out surrounding paragraphs.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
```
