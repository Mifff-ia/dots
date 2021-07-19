local lspconfig = require 'lspconfig'

local on_attach = function(client)
  local vimp = require 'vimp'
  vimp.nnoremap('K', function()
    return vim.lsp.buf.hover()
  end)
  return vimp.nnoremap('<c-]>', function()
    return vim.lsp.buf.definition()
  end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- default config
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }),
  },
})

-- LSPs
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = 'crate',
        importPrefix = 'by_self',
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

local sumneko_root_path = vim.fn.getenv 'HOME' .. '/opt/clone/lua-language-server'
lspconfig.sumneko_lua.setup {
  cmd = {
    sumneko_root_path .. '/bin/Linux/lua-language-server',
    '-E',
    sumneko_root_path .. '/main.lua',
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
      },
    },
  },
}

lspconfig.hls.setup {
  settings = {
    languageServerHaskell = {
      formattingProvider = 'stylish-haskell',
      completionSnippetsOn = true,
    },
  },
}
