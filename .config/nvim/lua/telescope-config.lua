local vimp = require 'vimp'
-- Telescope keybinds
local function ivy(opts)
  opts = opts or {}

  return vim.tbl_deep_extend('force', {
    sorting_strategy = 'ascending',

    preview_title = '',
    previewer = false,

    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 10,
    },

    prompt_prefix = ' @ ',
    selection_caret = ' ',
    entry_prefix = ' ',

    border = true,
    borderchars = {
      'z',
      prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
      results = { ' ' },
    },
  }, opts)
end

local tele_builtin = require 'telescope.builtin'
vimp.nnoremap('<leader>ev', function()
  tele_builtin.find_files(ivy { search_dirs = { '$XDG_CONFIG_HOME/nvim' } })
end)
vimp.nnoremap('<leader>ec', function()
  tele_builtin.find_files(ivy { search_dirs = { '$XDG_CONFIG_HOME/' } })
end)
vimp.nnoremap('<leader>b', function()
  tele_builtin.buffers(ivy())
end)
vimp.nnoremap('<leader>f', function()
  tele_builtin.find_files(ivy())
end)
