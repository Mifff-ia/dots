local vimp = require('vimp')

vim.g.mapleader = " "

vimp.nnoremap('J', 'mzJ`z')
vimp.nnoremap('zx', 'ZZ')

vimp.nnoremap('Q', 'q:')

-- D = d$ and C = c$ ... but Y = yy !?
vimp.nnoremap('Y', 'y$')

-- Convenience functions
vimp.nnoremap('<leader>on', function() vim.wo.number = not vim.wo.number end)
vimp.nnoremap('<leader>w', [[:up<cr>]])

-- Telescope keybinds
local tele_builtin = require('telescope.builtin')
local my_theme = require('telescope.themes').get_ivy {
    layout_config={height=10},
    previewer=false,
    prompt_prefix=' @ ',
    selection_caret=' ',
    entry_prefix=' ',
    search_dirs={"$XDG_CONFIG_HOME/nvim"},
    prompt_title=false,
  }
vimp.nnoremap('<leader>ev', function() tele_builtin.find_files(my_theme) end)
-- vimp.nnoremap('<leader>f', [[:Files<cr>]])

vimp.nnoremap('<leader>z', function() require('zen-mode').toggle() end)
vimp.nnoremap('<leader>r', [[:luafile $MYVIMRC<cr>]])

-- Tab completion while also having tabbing functionality intact
vimp.inoremap({'expr'}, '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Some convenient brace expanding commands
vimp.inoremap(';b', '{<cr>}<esc>O')
vimp.inoremap(';;b', '{<cr>};<esc>O')
vimp.inoremap(';,b', '{<cr>};<esc>O')

-- Control backspace is pretty good
vimp.bind('ic', '', '<c-w>')

-- Easy to reach seperated system clipboard
for _, i in ipairs({'y', 'd', 'p', 'P'}) do
  vimp.rbind('nv', '<leader>' .. i, '"+' .. i)
end

-- Default bindings for window manipulation are pretty bad ngl
for _, i in ipairs({ 'h', 'j', 'k', 'l' }) do
  vimp.nnoremap('<leader>' .. i, '<c-w>' .. i)
  local up = string.upper(i)
  vimp.nnoremap('<leader>' .. up, '<c-w>' .. up)
end
