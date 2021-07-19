local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'

local execute = vim.api.nvim_command
local fn = vim.fn
if fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- let packer maintain itself
  use { 'wbthomason/packer.nvim', opt = true }

  use 'tweekmonster/startuptime.vim'

  -- movement/quality of life
  use {
    'b3nj5m1n/kommentary',
    keys = 'gc',
  }
  use 'tpope/vim-eunuch'
  use {
    'tpope/vim-repeat',
    opt = true,
  }
  use {
    'tpope/vim-unimpaired',
    keys = { '[', ']', 'yo' },
    requires = 'vim-repeat',
  }
  use 'machakann/vim-sandwich'

  -- lsp
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('compe').setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 4,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
          path = true,
          nvim_lsp = true,
          neorg = true,
        },
      }
    end,
  }
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/playground',
    run = ':TSUpdate',
    config = function()
      local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

      parser_configs.norg = {
        install_info = {
          url = 'https://github.com/vhyrro/tree-sitter-norg',
          files = { 'src/parser.c' },
          branch = 'main',
        },
      }
      --[[ vim.opt["foldmethod"] = "expr"
			vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()" ]]
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'maintained', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
        highlight = {
          enable = true, -- false will disable the whole extension
          custom_captures = {
            field = 'Normal',
          },
        },
        indent = {
          enable = false,
        },
        playground = {
          enable = true,
        },
      }
    end,
  }

  -- nvim config
  use 'svermeulen/vimpeccable'
  use 'editorconfig/editorconfig-vim'

  -- lisp
  use {
    'eraserhd/parinfer-rust',
    run = 'cargo build --release',
  }

  -- latex
  use {
    'lervag/vimtex',
    filetype = 'latex',
    config = function()
      require('util').set_vars {
        tex_flavor = 'latex',
        vimtex_view_method = 'zathura',
        vimtex_quickfix_mode = '0',
      }
    end,
  }

  -- filetype/syntax
  use 'https://tildegit.org/sloum/gemini-vim-syntax'

  -- aesthetic
  use {
    'norcalli/nvim-base16.lua',
    config = function()
      local base16 = require 'base16'
      base16(base16.themes.circus, true)
    end,
  }
  use 'rktjmp/lush.nvim'

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
  }

  -- better gitting
  use {
    'TimUntersberger/neogit',
    module = 'neogit',
    cmd = 'Neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup {}
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    disable = true,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Note taking
  use {
    'vhyrro/neorg',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neorg').setup {
        -- tell neorg what modules to load
        load = {
          ['core.defaults'] = {}, -- load all the default modules
          ['core.keybinds'] = { -- configure core.keybinds
            config = {
              default_keybinds = true, -- generate the default keybinds
              neorg_leader = '<leader>o', -- this is the default if unspecified
            },
          },
          -- ["core.norg.concealer"] = {}, -- allows for use of icons
          ['core.norg.dirman'] = { -- manage your directories with neorg
            config = {
              workspaces = {
                my_workspace = '~/docs/neorg',
              },
            },
          },
        },
      }
    end,
  }
end)
