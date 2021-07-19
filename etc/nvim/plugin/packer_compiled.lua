-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/max/var/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/max/var/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/max/var/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/max/var/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/max/var/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  kommentary = {
    keys = { { "", "gc" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/max/usr/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    config = { "\27LJ\2\nã\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0035\4\f\0005\5\n\0005\6\t\0=\6\v\5=\5\a\4=\4\r\3=\3\15\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\17~/docs/neorg\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-base16.lua"] = {
    config = { "\27LJ\2\nH\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\2\18\1\0\0009\3\2\0009\3\3\3+\4\2\0B\1\3\1K\0\1\0\vcircus\vthemes\vbase16\frequire\0" },
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nó\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\3\rnvim_lsp\2\nneorg\2\tpath\2\1\0\f\17autocomplete\2\fenabled\2\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\ndebug\1\14preselect\venable\15min_length\3\4\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÇ\4\0\0\6\0\26\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0006\1\t\0009\1\n\1'\2\f\0=\2\v\0016\1\t\0009\1\n\1'\2\14\0=\2\r\0016\1\0\0'\3\15\0B\1\2\0029\1\16\0015\3\17\0005\4\18\0005\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3B\1\2\1K\0\1\0\15playground\1\0\1\venable\2\vindent\1\0\1\venable\1\14highlight\20custom_captures\1\0\1\nfield\vNormal\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\bopt\bvim\17install_info\1\0\0\nfiles\1\2\0\0\17src/parser.c\1\0\2\burl/https://github.com/vhyrro/tree-sitter-norg\vbranch\tmain\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/max/usr/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/parinfer-rust"
  },
  playground = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/max/usr/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-unimpaired"] = {
    keys = { { "", "[" }, { "", "]" }, { "", "yo" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/max/usr/share/nvim/site/pack/packer/opt/vim-unimpaired"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/vimpeccable"
  },
  vimtex = {
    config = { "\27LJ\2\n\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\23vimtex_view_method\fzathura\15tex_flavor\nlatex\25vimtex_quickfix_mode\0060\rset_vars\tutil\frequire\0" },
    loaded = true,
    path = "/home/max/usr/share/nvim/site/pack/packer/start/vimtex"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neogit"] = "neogit"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\nó\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\3\rnvim_lsp\2\nneorg\2\tpath\2\1\0\f\17autocomplete\2\fenabled\2\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\ndebug\1\14preselect\venable\15min_length\3\4\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\nã\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0035\4\f\0005\5\n\0005\6\t\0=\6\v\5=\5\a\4=\4\r\3=\3\15\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\17~/docs/neorg\18core.keybinds\vconfig\1\0\0\1\0\2\17neorg_leader\14<leader>o\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÇ\4\0\0\6\0\26\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0006\1\t\0009\1\n\1'\2\f\0=\2\v\0016\1\t\0009\1\n\1'\2\14\0=\2\r\0016\1\0\0'\3\15\0B\1\2\0029\1\16\0015\3\17\0005\4\18\0005\5\19\0=\5\20\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3B\1\2\1K\0\1\0\15playground\1\0\1\venable\2\vindent\1\0\1\venable\1\14highlight\20custom_captures\1\0\1\nfield\vNormal\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\bopt\bvim\17install_info\1\0\0\nfiles\1\2\0\0\17src/parser.c\1\0\2\burl/https://github.com/vhyrro/tree-sitter-norg\vbranch\tmain\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\23vimtex_view_method\fzathura\15tex_flavor\nlatex\25vimtex_quickfix_mode\0060\rset_vars\tutil\frequire\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: nvim-base16.lua
time([[Config for nvim-base16.lua]], true)
try_loadstring("\27LJ\2\nH\0\0\5\0\4\0\t6\0\0\0'\2\1\0B\0\2\2\18\1\0\0009\3\2\0009\3\3\3+\4\2\0B\1\3\1K\0\1\0\vcircus\vthemes\vbase16\frequire\0", "config", "nvim-base16.lua")
time([[Config for nvim-base16.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":Neogit") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'kommentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> yo <cmd>lua require("packer.load")({'vim-unimpaired'}, { keys = "yo", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> [ <cmd>lua require("packer.load")({'vim-unimpaired'}, { keys = "[", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ] <cmd>lua require("packer.load")({'vim-unimpaired'}, { keys = "]", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
