local lspconfig = require('lspconfig')
local completion = require('completion')

local lsp_attach = function(client)
  vimp.nnoremap('K', function() return vim.cmd('lua vim.lsp.buf.hover()') end)
  vimp.nnoremap('<c-]>', function() return vim.cmd('lua vim.lsp.buf.definition()') end)

  return completion.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false
  })

lspconfig.clangd.setup({on_attach = lsp_attach})
lspconfig.hls.setup({on_attach = lsp_attach})

