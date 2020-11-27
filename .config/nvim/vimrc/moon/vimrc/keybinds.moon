util = require('vimrc.util')
MoonMaker = require("moonmaker")

vim.g.mapleader = " "

vimp.nnoremap 'J',  'mzJ`z' -- Keep the cursor in place while joining lines
vimp.nnoremap 'zx', 'ZZ'

vimp.nnoremap '<leader>n',  -> vim.wo.number = not vim.wo.number -- Toggle line numbers
vimp.nnoremap '<leader>w',  -> vim.cmd 'up'
vimp.nnoremap '<leader>ev', -> vim.cmd 'Files $XDG_CONFIG_HOME/nvim/' -- Edit the vimrc
vimp.nnoremap '<leader>g',  -> vim.cmd 'Goyo'

-- Completion
vimp.inoremap {'expr',}, '<tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]]
vimp.inoremap {'expr',}, '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

-- System clipboard
for _, i in ipairs({'y', 'd', 'p', 'P'})
    vimp.rbind 'nv', '<leader>'..i, '"+'..i

-- Split switching
for _, i in ipairs({'h', 'j', 'k', 'l'})
    vimp.nnoremap '<leader>'..i, '<c-w>'..i
    up = string.upper(i) -- map for the uppercase binding as well
    vimp.nnoremap '<leader>'..up, '<c-w>'..up


vimp.nnoremap '<leader>r', -> -- Hot reload config
    vim.cmd 'source $MYVIMRC'
    vimp.unmap_all!
    util.unload_lua_namespace 'vimrc'
    vim.cmd 'silent wa'
    MoonMaker.compileAll false
    require('vimrc')
    print("Reloaded vimrc")
