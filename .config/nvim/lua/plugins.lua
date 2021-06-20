local execute = vim.api.nvim_command
local fn = vim.fn
local util = require('util')

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- let packer maintain itself
  use {'wbthomason/packer.nvim', opt = true}

  use {'tweekmonster/startuptime.vim'}

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    requires = {'nvim-lua/completion-nvim'}
  }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = false,              -- false will disable the whole extension
        },
      }
    end,
  }
  -- use 'nvim-treesitter/playground'

  -- nvim config
  use 'svermeulen/vimpeccable'
  use 'editorconfig/editorconfig-vim'

  -- lisp
  use {
    'guns/vim-sexp',
    as = 'sexp',
    opt = true,
    requires = {'tpope/vim-sexp-mappings-for-regular-people', opt=true},
  }
  use {
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
    requires = 'sexp',
  }

  -- latex
  use {
    'lervag/vimtex',
  }

  -- filetype/syntax
  use 'euclidianAce/BetterLua.vim'
  use {
    'sheerun/vim-polyglot',
    config = function()
      vim.api.nvim_set_var('polyglot_disabled', {'lua.plugin','autoindent'})
    end,
  }
  use 'https://tildegit.org/sloum/gemini-vim-syntax'

  -- aesthetic
  use {
    'norcalli/nvim-base16.lua',
    config = function()
      local base16 = require'base16'
      base16(base16.themes.circus, true)
    end,
  }
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  -- fuzzy finding
  -- use {
  --   'junegunn/fzf.vim',
  --   requires = {'junegunn/fzf', opt = true}
  -- }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }

  -- movement/quality of life
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'machakann/vim-sandwich'
  use 'jesseleite/vim-noh'

  -- better gitting
  use 'tpope/vim-fugitive'
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }

end)
