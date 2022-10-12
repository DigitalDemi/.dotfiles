-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Toggle Nerd tree 
keymap("n", "<leader>e", ":NeoTreeFloatToggle<CR>", opts)


keymap("n", "<S-l>", ":bnext<CR>",opts)

keymap("n", "<S-h>", ":bnext<CR>",opts)
