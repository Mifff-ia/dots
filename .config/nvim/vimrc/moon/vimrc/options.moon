vim.o.foldmethod = 'marker'

vim.o.shortmess = vim.o.shortmess..'I' -- Don't show the intro screen

vim.o.completeopt = 'menuone,noinsert,noselect'

--  Some search improvements
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Saner split defaults
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.hidden = true

vim.o.history = 5000

-- Tab option
vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop

-- Visual options
vim.o.laststatus = 1
vim.o.showtabline = 1

vim.o.termguicolors = true
vim.cmd('colorscheme base16-material-darker')

