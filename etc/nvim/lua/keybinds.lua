local vimp = require 'vimp'

vim.g.mapleader = ' '

vimp.nnoremap('J', 'mzJ`z')
vimp.nnoremap('zx', 'ZZ')

vimp.nnoremap('Q', 'q:')

-- D = d$ and C = c$ ... but Y = yy ?!
vimp.nnoremap('Y', 'y$')

-- Convenience functions
vimp.nnoremap('<leader>w', [[:up<cr>]])

-- Some convenient brace expanding commands
vimp.inoremap(';b', '{<cr>}<esc>O')
vimp.inoremap(';,b', '{<cr>},<esc>O')
vimp.inoremap(';;b', '{<cr>};<esc>O')

-- Control backspace is pretty good
vimp.bind('ic', '', '<c-w>')

-- Easy to reach seperated system clipboard
for _, i in ipairs { 'y', 'd', 'p', 'P' } do
  vimp.rbind('nv', '<leader>' .. i, '"+' .. i)
end

-- Default bindings for window manipulation are pretty bad ngl
for _, i in ipairs { 'h', 'j', 'k', 'l' } do
  vimp.nnoremap('<leader>' .. i, '<c-w>' .. i)
  local up = string.upper(i)
  vimp.nnoremap('<leader>' .. up, '<c-w>' .. up)
end
