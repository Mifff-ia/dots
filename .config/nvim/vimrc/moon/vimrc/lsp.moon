lspconfig = require('lspconfig')
completion = require('completion')

lsp_attach = (client) ->
    vimp.nnoremap 'K', -> vim.cmd 'lua vim.lsp.buf.hover()'
    vimp.nnoremap '<c-]>', -> vim.cmd 'lua vim.lsp.buf.definition()'

    vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

    completion.on_attach client

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text: true,

    signs: true,

    update_in_insert: false,
  }

lspconfig.clangd.setup{on_attach: lsp_attach}
lspconfig.hls.setup{on_attach: lsp_attach}
