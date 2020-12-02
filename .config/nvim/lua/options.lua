local set_options = {
  foldmethod = 'marker',
  shortmess = 'atToOFI',
  completeopt = 'menuone,noinsert,noselect',

  -- search options
  ignorecase = true,
  smartcase = true,
  incsearch = true,

  -- saner split defaults
  splitright = true,
  splitbelow = true,

  -- don't annoy me to save stuff
  hidden = true,

  -- history = 5000,

  -- tab options
  -- currently doesn't work for the first opened buffer
  -- issue #12978
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- statuslines
  laststatus = 2,
  showtabline = 1,

  termguicolors = true,
}
for option, value in pairs(set_options) do
  vim.api.nvim_set_option(option, value)
end

local global_vars = {
  -- filetype options
  zig_fmt_autosave = false,

  haskell_enable_quantification = 1,
  haskell_enable_recursivedo = 1,
  haskell_enable_arrowsyntax = 1,
  haskell_enable_pattern_synonyms = 1,
  haskell_enable_typeroles = 1,
  haskell_enable_static_pointers = 1,
  haskell_backpack = 1,
}
for var, value in pairs(global_vars) do
  vim.api.nvim_set_var(var, value)
end


