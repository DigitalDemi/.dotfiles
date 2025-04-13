local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()builtin.find_files({file_ignore_patterns = { 'node_modules', '.git', '.venv' },hidden = true})end)
vim.keymap.set('n', '<C-p>', builtin.git_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

