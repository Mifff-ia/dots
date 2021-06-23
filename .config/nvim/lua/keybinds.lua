local vimp = require('vimp')
local util = require('util')

vim.g.mapleader = " "

vimp.nnoremap('J', 'mzJ`z')
vimp.nnoremap('zx', 'ZZ')

vimp.nnoremap('Q', 'q:')

-- D = d$ and C = c$ ... but Y = yy !?
vimp.nnoremap('Y', 'y$')

-- Convenience functions
vimp.nnoremap('<leader>w', [[:up<cr>]])

vimp.nnoremap('<leader>z', function() require('zen-mode').toggle() end)
vimp.nnoremap('<leader>r', [[:luafile $MYVIMRC<cr>]])

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

-- Tab functionality
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local luasnip = util.prequire('luasnip')

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

-- Tab completion while also having tabbing functionality intact
vimp.rbind('is', {'expr'}, '<tab>', 'v:lua.tab_complete()')
vimp.rbind('is', {'expr'}, '<s-tab>', 'v:lua.s_tab_complete()')

-- Telescope keybinds
local function ivy(opts)
  opts = opts or {}

  return vim.tbl_deep_extend("force", {
    sorting_strategy = "ascending",

    preview_title = "",
    previewer = false,

    layout_strategy = "bottom_pane",
    layout_config = {
      height = 10,
    },

    prompt_prefix=' @ ',
    selection_caret=' ',
    entry_prefix=' ',

    border = true,
    borderchars = {
      "z",
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
    },
  }, opts)
end

local tele_builtin = require('telescope.builtin')
vimp.nnoremap('<leader>ev', function()
  tele_builtin.find_files(ivy({search_dirs={'$XDG_CONFIG_HOME/nvim'}}))
end)
vimp.nnoremap('<leader>b', function()
  tele_builtin.buffers(ivy())
end)
vimp.nnoremap('<leader>f', function() tele_builtin.find_files(ivy()) end)
