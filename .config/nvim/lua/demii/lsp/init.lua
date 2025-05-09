local servers = {
    luals = require("demii.lsp.luals"),
    basedpyright = require("demii.lsp.basedpyright")
}

-- vim.notify("Loaded LSP configs: " .. vim.inspect(servers)) - for debugging
vim.lsp.config = servers

vim.lsp.enable({
    "luals",
    "basedpyright",
})

