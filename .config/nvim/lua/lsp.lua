local lspconfig = require('lspconfig')

local lsp_attach = function(client)
  vimp.nnoremap('K', function() return vim.lsp.buf.hover() end)
  return vimp.nnoremap('<c-]>', function() return vim.lsp.buf.definition() end)
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
lspconfig.pyls.setup({
    on_attach = lsp_attach;
    root_dir = function(fname)
      return lspconfig.util.root_pattern(
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "mypy.ini",
        ".pylintrc",
        ".flake8rc",
        ".gitignore"
        )(fname)
      or lspconfig.util.find_git_ancestor(fname)
      or vim.loop.os_homedir()
    end
  })
lspconfig.rust_analyzer.setup({
    on_attach = lsp_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "crate",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
lspconfig.zls.setup({on_attach = lsp_attach;})
