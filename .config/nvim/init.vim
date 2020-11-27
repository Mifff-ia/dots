call plug#begin('~/.local/share/nvim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Moonscript vimrc related
Plug 'svermeulen/nvim-moonmaker'
Plug 'svermeulen/vimpeccable'
Plug $XDG_CONFIG_HOME . '/nvim/vimrc'

" Lua stuff
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'

" Filetypes
Plug 'leafo/moonscript-vim'

" Aesthetic
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'

" Quality of Life
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'

" Movement
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()
