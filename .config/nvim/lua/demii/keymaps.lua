vim.g.mapleader = ' '                                

vim.g.tmux_navigator_no_mappings = 1                
local map = vim.keymap.set                         

local has_oil, oil = pcall(require, 'oil')

if has_oil then
  map('n', '<leader>pv', function() oil.open() end,
    { desc = "Oil Explorer" })
else
  map('n', '<leader>pv', vim.cmd.Ex,
    { desc = "Explorer (vim.cmd.Ex)" })
end

-- map('n', '<C-h>',    ':TmuxNavigateLeft<CR>',         { silent = true, desc = "Tmux ←" })
-- map('n', '<C-j>',    ':TmuxNavigateDown<CR>',         { silent = true, desc = "Tmux ↓" })
-- map('n', '<C-k>',    ':TmuxNavigateUp<CR>',           { silent = true, desc = "Tmux ↑" })
-- map('n', '<C-l>',    ':TmuxNavigateRight<CR>',        { silent = true, desc = "Tmux →" })
-- map('n', '<C-\\>',   ':TmuxNavigatePrevious<CR>',     { silent = true, desc = "Tmux prev pane" })

map('v', 'J', ":m '>+1<CR>gv=gv",                      { desc = "Move selection down" })
map('v', 'K', ":m '<-2<CR>gv=gv",                      { desc = "Move selection up"   })

map('n', '<C-d>', '<C-d>zz',                           { desc = "Scroll down + center" })
map('n', '<C-u>', '<C-u>zz',                           { desc = "Scroll up + center"   })

map({'n','v'}, '<leader>y', '"+y',                      { desc = "Yank → system clipboard" })
map('n',         '<leader>Y', '"+Y',                    { desc = "Yank line → system clipboard" })

map({'n','v','o'}, '<leader>d', '"_d',                 { desc = "Delete → void register" })
map({'n','v','o'}, '<leader>c', '"_c',                 { desc = "Change → void register" })
map('n',         '<leader>x', '"_x',                   { desc = "Delete char → void register" })

map('n', 'Q', '<nop>',                                  { desc = "Disable Q" })

-- map('n', '<C-n>', '<cmd>cnext<CR>zz',                   { desc = "Quickfix Next + center" })
-- map('n', '<C-p>', '<cmd>cprev<CR>zz',                   { desc = "Quickfix Prev + center" })
map('n', '<leader>n','<cmd>lnext<CR>zz',                { desc = "Loclist Next + center" })
map('n', '<leader>p','<cmd>lprev<CR>zz',                { desc = "Loclist Prev + center" })
--
-- map('i', '<C-BS>',  '<C-o>"_db',                       { desc = "⌫ Delete prev word (void)" })
-- map('i', '<M-d>',   '<C-o>"_dw',                       { desc = "Delete to end of word (void)" })
-- map('i', '<M-BS>',  '<C-o>"_db',                       { desc = "Delete to start of word (void)" })

