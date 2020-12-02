vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- let packer maintain itself
  use {'wbthomason/packer.nvim', opt = true}

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  -- lua
  use 'svermeulen/vimpeccable'

  -- filetype
  use 'ziglang/zig.vim'
  use 'neovimhaskell/haskell-vim'
  use 'euclidianAce/BetterLua.vim'

  -- aesthetic
  use 'junegunn/goyo.vim'
  use 'chriskempson/base16-vim'

  -- fuzzy finding
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- movement/quality of life
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

end)

vim.cmd('colorscheme base16-material-darker')

require('options')
require('keybinds')
require('lsp')
