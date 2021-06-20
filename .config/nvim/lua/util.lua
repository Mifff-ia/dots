local M = {}

function M.set_vars(tbl)
  for var, value in pairs(tbl) do
    vim.api.nvim_set_var(var, value)
  end
end

function M.set_options(tbl)
  for var, value in pairs(tbl) do
    vim.api.nvim_set_option(var,value)
  end
end

return M
