local util = require('util')
util.set_options {
  foldmethod = 'marker',
  shortmess = vim.o.shortmess .. 'I',
  completeopt = 'menuone,noinsert,noselect',

  -- search options
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  hlsearch = false,

  -- saner split defaults
  splitright = true,
  splitbelow = true,

  -- don't annoy me to save stuff on buffer switch
  hidden = true,

  -- history = 5000,
  
  -- number options
  number = false,

  -- tab options
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- statuslines
  laststatus = 1,
  showtabline = 1,

  termguicolors = true,

  -- aesthetic changes
  -- guicursor = '',
  showmode = false,
  ruler = false,
  fcs = 'eob: ',
}
