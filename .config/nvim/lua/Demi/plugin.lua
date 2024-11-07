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
    { 'nvim-telescope/telescope.nvim' },
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

    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },

    { "scottmckendry/cyberdream.nvim", priority = 1000 },
    -- example lazy.nvim install setup
    -- {
    --     "slugbyte/lackluster.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     init = function()
    --         vim.cmd.colorscheme("lackluster")
    --         -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    --         -- vim.cmd.colorscheme("lackluster-mint")
    --     end,
    -- },

    {'VonHeikemen/lsp-zero.nvim'},
    
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        version = "v2.3", -- Use the latest stable version
        build = "make install_jsregexp"
    },

    -- Tagging and Autocompletion
    { 'windwp/nvim-ts-autotag' },

    -- Statusline and UI
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { "lukas-reineke/indent-blankline.nvim" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Tmux Integration
    { 'christoomey/vim-tmux-navigator' },

    -- Game for practice
    { 'ThePrimeagen/vim-be-good' },

    -- Comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Obsidian integration for notes
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- Recommended: use latest release
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            workspaces = {
                { name = "personal", path = "/home/demi/.Obsidian" },
                -- { name = "work", path = "~/vaults/work" },
            },
        },
    },

    -- Typing speed control
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- Transparent background
    { 'tribela/vim-transparent' },

    -- Discord Rich Presence
    { 'andweeb/presence.nvim' },

    -- Git Integration
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    -- Colorizer
    { 'norcalli/nvim-colorizer.lua' },

    -- Debugging
    { 'mfussenegger/nvim-dap' },

    -- Live server for web development
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true,
    },
}

local opts = {}

-- Load plugins
require("lazy").setup(plugins, opts)

-- Mason setup
require('mason').setup()

-- Set Treesitter compiler
require 'nvim-treesitter.install'.compilers = { "clang" }

