local lspconfig = require('lspconfig')

local lsp_attach = function(client)
  vimp.nnoremap('K', function() return vim.lsp.buf.hover() end)
  vimp.nnoremap('<c-]>', function() return vim.lsp.buf.definition() end)
  vimp.vnoremap('gq', function() return vim.lsp.buf.range_formatting() end)

  return require('completion').on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false
  })

lspconfig.clangd.setup({on_attach = lsp_attach})
lspconfig.hls.setup({
  on_attach = lsp_attach;
  settings = {
    haskell = {
      formattingProvider = "ormolu";
      formatOnImportOn = true;
    };
  };
})
lspconfig.rust_analyzer.setup({on_attach = lsp_attach;})
lspconfig.zls.setup({on_attach = lsp_attach;})
