local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- let packer maintain itself
  use {'wbthomason/packer.nvim', opt = true}

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  -- tree sitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  -- lua
  use 'svermeulen/vimpeccable'
  -- use 'nvim-lua/plenary.nvim'

  -- latex
  use 'lervag/vimtex'
  use 'sirver/ultisnips'

  -- filetype/syntax
  -- use 'euclidianAce/BetterLua.vim'
  use 'neovimhaskell/haskell-vim'
  use 'ziglang/zig.vim'

  -- aesthetic
  use 'chriskempson/base16-vim'
  use 'junegunn/goyo.vim'
  -- use 'tjdevries/express_line.nvim'
  -- use {
  --   'itchyny/lightline.vim',
  --   requires = {'mike-hearn/base16-vim-lightline', opt = true}
  -- }

  -- fuzzy finding
  use {
    'junegunn/fzf.vim',
    requires = {'junegunn/fzf', opt = true}
  }

  -- movement/quality of life
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'jesseleite/vim-noh'

  -- better gitting
  use 'tpope/vim-fugitive'

  -- firefox integration
  -- use {'glacambre/firenvim', run = ':call firenvim#install(0)'}
end)

vim.cmd('colorscheme base16-atelier-savanna')
