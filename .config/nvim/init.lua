vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- let packer maintain itself
  use {'wbthomason/packer.nvim', opt = true}

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  -- lua
  use 'svermeulen/vimpeccable'

  -- latex
  use 'lervag/vimtex'

  -- filetype/syntax
  use 'euclidianAce/BetterLua.vim'
  use 'neovimhaskell/haskell-vim'
  use 'ziglang/zig.vim'

  -- aesthetic
  use 'chriskempson/base16-vim'
  use 'junegunn/goyo.vim'

  -- fuzzy finding
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- movement/quality of life
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
end)

vim.cmd('colorscheme base16-material-darker')

require('options')
require('keybinds')
require('lsp')
