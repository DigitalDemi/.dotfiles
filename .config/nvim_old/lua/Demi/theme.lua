vim.o.termguicolors = true
vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = function()
--         vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
--     end
-- })
-- vim.opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "lackluster"
-- vim.cmd.colorscheme "cyberdream"
