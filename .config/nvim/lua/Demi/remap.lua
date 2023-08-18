vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- Set the variable to disable mappings
vim.g.tmux_navigator_no_mappings = 1

-- Example mappings:
vim.api.nvim_set_keymap('n', '{Left-Mapping}', ':<C-U>TmuxNavigateLeft<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '{Down-Mapping}', ':<C-U>TmuxNavigateDown<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '{Up-Mapping}', ':<C-U>TmuxNavigateUp<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '{Right-Mapping}', ':<C-U>TmuxNavigateRight<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '{Previous-Mapping}', ':<C-U>TmuxNavigatePrevious<cr>', {silent = true})

