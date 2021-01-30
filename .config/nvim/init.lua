-- Hello! Welcome to my init.lua.
-- 
-- Order of the `requires` matter. If the keybinds are after
-- options and there's an error in options, the evaluation
-- stops there and you're stuck without your keybinds. :(

require('plugins')
require('keybinds')
require('options')
require('lsp')

