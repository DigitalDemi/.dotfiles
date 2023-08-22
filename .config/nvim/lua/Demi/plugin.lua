local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {"folke/which-key.nvim"},
    { "folke/neoconf.nvim",   cmd = "Neoconf" },
    {"folke/neodev.nvim"},
    {'nvim-telescope/telescope.nvim'},
    { 'nvim-lua/plenary.nvim' },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update { sync = true }
        end,
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'HiPhish/nvim-ts-rainbow2' },
            { 'mfussenegger/nvim-treehopper' },
            { 'mizlan/iswap.nvim' },
            { 'romgrk/nvim-treesitter-context' },
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
            { 'cshuaimin/ssr.nvim' },
        },
    },
    { "catppuccin/nvim",        name = "catppuccin", priority = 1000 },
    { 'tribela/vim-transparent' },
    { 'rktjmp/lush.nvim' },
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },                  -- Required
    { 'hrsh7th/cmp-nvim-lsp' },              -- Required
    { 'L3MON4D3/LuaSnip' },                  -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'windwp/nvim-ts-autotag' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        { "lukas-reineke/indent-blankline.nvim" },
        {
            'ThePrimeagen/harpoon',
            dependencies = { 'nvim-lua/plenary.nvim' },
        }
    },
    { 'christoomey/vim-tmux-navigator' },
    { 'ThePrimeagen/vim-be-good' },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    { 'tribela/vim-transparent' },
    { 'andweeb/presence.nvim' },
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'norcalli/nvim-colorizer.lua' },
    -- Debug
    { 'mfussenegger/nvim-dap' },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }
}

require("lazy").setup(plugins, opts)

require 'nvim-treesitter.install'.compilers = { "clang" }

require('mason').setup()
