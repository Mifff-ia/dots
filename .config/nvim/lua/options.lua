local set_options = {
  foldmethod = 'marker',
  -- shortmess = 'atToOFI',
  completeopt = 'menuone,noinsert,noselect',

  -- search options
  ignorecase = true,
  smartcase = true,
  incsearch = true,

  -- saner split defaults
  splitright = true,
  splitbelow = true,

  -- don't annoy me to save stuff on buffer switch
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
  laststatus = 1,
  showtabline = 1,

  termguicolors = true,

  -- aesthetic changes
  guicursor = '',
  showmode = false,
  ruler = false,
  fcs = 'eob: ',
}
for option, value in pairs(set_options) do
  vim.api.nvim_set_option(option, value)
end

-- workaround for issue #12978
-- but somehow makes nvim act up
-- vim.cmd("set tabstop=2 shiftwidth=2 expandtab autoindent smartindent")

local global_vars = {
  -- filetype options
  zig_fmt_autosave = false,

  tex_flavor = "latex",
  vimtex_view_method = "zathura",
  vimtex_quickfix_mode = 0,

  haskell_enable_quantification = 1,
  haskell_enable_recursivedo = 1,
  haskell_enable_arrowsyntax = 1,
  haskell_enable_pattern_synonyms = 1,
  haskell_enable_typeroles = 1,
  haskell_enable_static_pointers = 1,
  haskell_backpack = 1,

  -- snippet options
  UltiSnipsExpandTrigger = "<c-l>",
  UltiSnipsJumpForwardTrigger = "<c-l>",
  UltiSnipsJumpBackwardTrigger = "<c-h>",

  -- lightline options
  lightline = { colorscheme = 'base16_atelier_savanna' }
}
for var, value in pairs(global_vars) do
  vim.api.nvim_set_var(var, value)
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
