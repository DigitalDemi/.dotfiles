_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
require('impatient').enable_profile()


vim.cmd([[
set shell=pwsh
set shellcmdflag=-command
set shellquote=\"
set shellxquote=
]])

vim.g.python3_host_prog = 'C:\\Users\\Demii\\AppData\\Local\\Programs\\Python\\Python310\\python.exe'


local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


require('general')
require('plugins')
require('bindings')
require('plugConfig.toggleTerm')
require('plugConfig.bufferline')
require('plugConfig.lualine')

require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require('toggle_lsp_diagnostics').init()

require("nvim-tree").setup()

require('rust-tools').setup({})



