-- Numbers in vim
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs/spaces
vim.opt.tabstop = 4
vim.softabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")

vim.opt.termguicolors = true


vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true
vim.opt.cursorcolumn = true


vim.g.have_nerd_font = true

local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_grp,
  callback = function()
    vim.highlight.on_yank {
      higroup  = "IncSearch",    
      timeout  = 200,           
      on_visual = false,       
    }
  end,
})



