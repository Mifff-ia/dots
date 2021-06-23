local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

local execute = vim.api.nvim_command
local fn = vim.fn
if fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- let packer maintain itself
  use {'wbthomason/packer.nvim', opt = true}

  use 'tweekmonster/startuptime.vim'

  -- movement/quality of life
  use {
    'tpope/vim-commentary',
    keys = 'gc',
  }
  use 'tpope/vim-eunuch'
  use {
    'tpope/vim-repeat',
    opt = true,
  }
  use {
    'tpope/vim-unimpaired',
    keys = {'[', ']', 'yo'},
    requires = 'vim-repeat',
  }
  use 'machakann/vim-sandwich'

  -- lsp
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 4;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = true;

        source = {
          path = true;
          nvim_lsp = true;
        };
      }
    end,
  }
  use {
    'neovim/nvim-lspconfig',
    requires = 'nvim-compe',
  }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.api.nvim_set_option('foldmethod', 'expr')
      vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true, -- false will disable the whole extension
          custom_captures = {
            field = "Normal",
          },
        },
      }
    end,
  }
  use 'nvim-treesitter/playground'

  -- nvim config
  use 'svermeulen/vimpeccable'
  use 'editorconfig/editorconfig-vim'

  -- lisp
  use {
    'guns/vim-sexp',
    opt = true,
    requires = {'tpope/vim-sexp-mappings-for-regular-people', 'vim-repeat'},
  }
  use {
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
    requires = 'vim-sexp',
  }

  -- latex
  use {
    'lervag/vimtex',
    filetype = 'latex',
    config = function()
      require('util').set_vars({
          tex_flavor = 'latex',
          vimtex_view_method = 'zathura',
          vimtex_quickfix_mode = '0',
        })
    end,
  }

  -- filetype/syntax
  use {
    'euclidianAce/BetterLua.vim',
    disable = true,
  }
  use {
    'sheerun/vim-polyglot',
    disable = true,
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
    'folke/zen-mode.nvim',
    module = 'zen-mode',
    cmd = 'ZenMode',
    config = function()
      require('zen-mode').setup {}
    end,
  }
  use {
    'famiu/feline.nvim',
    disable = true,
    config = function()
      require('feline').setup({
          preset = 'noicon',
        })
    end,
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


  -- better gitting
  use {
    'TimUntersberger/neogit',
    module = 'neogit',
    cmd = 'Neogit',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('neogit').setup {

      }
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    disable = true,
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- https://github.com/ray-x/lsp_signature.nvim
  -- https://github.com/mfussenegger/nvim-dap
  -- 
end)
