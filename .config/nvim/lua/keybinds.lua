local vimp = require('vimp')

vim.g.mapleader = " "

vimp.nnoremap('J', 'mzJ`z')
vimp.nnoremap('zx', 'ZZ')

-- D = d$ and C = c$ ... but Y = yy !?
vimp.nnoremap('Y', 'y$')

-- Convenience functions
vimp.nnoremap('<leader>n', function() vim.wo.number = not vim.wo.number end)
vimp.nnoremap('<leader>w', function() return vim.cmd('up') end)
vimp.nnoremap('<leader>ev', function() return vim.cmd('Files $XDG_CONFIG_HOME/nvim/') end)
vimp.nnoremap('<leader>f', function() return vim.cmd('Files') end)
vimp.nnoremap('<leader>g', function() return vim.cmd('Goyo') end)
vimp.nnoremap('<leader>r', function() return vim.cmd('luafile $MYVIMRC') end)

-- Tab completion while also having tabbing functionality intact
vimp.inoremap({'expr'}, '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Some convenient brace expanding commands
vimp.inoremap(';b', '{<cr>}<esc>O')
vimp.inoremap(';;b', '{<cr>};<esc>O')

-- Control backspace is pretty good
vimp.bind('ic', '', '<c-w>')

-- Easy to reach seperated system clipboard
for _, i in ipairs({ 'y', 'd', 'p', 'P' }) do
  vimp.rbind('nv', '<leader>' .. i, '"+' .. i)
end

-- Default bindings are pretty bad ngl
for _, i in ipairs({ 'h', 'j', 'k', 'l' }) do
  vimp.nnoremap('<leader>' .. i, '<c-w>' .. i)
  local up = string.upper(i)
  vimp.nnoremap('<leader>' .. up, '<c-w>' .. up)
end
