local vimp = require('vimp')

vim.g.mapleader = " "

vimp.nnoremap('J', 'mzJ`z')
vimp.nnoremap('zx', 'ZZ')

vimp.nnoremap('<leader>n', function() vim.wo.number = not vim.wo.number end)
vimp.nnoremap('<leader>w', function() return vim.cmd('up') end)
vimp.nnoremap('<leader>ev', function() return vim.cmd('Files $XDG_CONFIG_HOME/nvim/') end)
vimp.nnoremap('<leader>g', function() return vim.cmd('Goyo') end)

vimp.inoremap({'expr'}, '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

for _, i in ipairs({ 'y', 'd', 'p', 'P' }) do
  vimp.rbind('nv', '<leader>' .. i, '"+' .. i)
end

for _, i in ipairs({ 'h', 'j', 'k', 'l' }) do
  vimp.nnoremap('<leader>' .. i, '<c-w>' .. i)
  local up = string.upper(i)
  vimp.nnoremap('<leader>' .. up, '<c-w>' .. up)
end
