local servers = {
  luals = require("demii.lsp.luals"),
}

-- vim.notify("Loaded LSP configs: " .. vim.inspect(servers)) - for debugging
vim.lsp.config = servers

vim.lsp.enable({
  "luals",
})

