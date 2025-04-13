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

    { 'nvim-telescope/telescope.nvim' }, -- Typical 
    { 'nvim-lua/plenary.nvim' }, -- Alot of plugins use
    {
        'nvim-treesitter/nvim-treesitter', -- Needed completed
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
        "lukas-reineke/headlines.nvim", -- for markdown highlighting
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },


    -- {'VonHeikemen/lsp-zero.nvim'}, -- not ndded anymore however good documentation will be moved later

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
    -- { 'hrsh7th/nvim-cmp' }, -- Required
    -- { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    -- { 'hrsh7th/cmp-buffer' },
    -- { 'saadparwaiz1/cmp_luasnip' },
    --
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
    },

    -- Snippets
    {
        'L3MON4D3/LuaSnip',
        version = "v2.3", -- Use the latest stable version
        build = "make install_jsregexp"
    },

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

    -- Comments
    {'numToStr/Comment.nvim'},

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

    -- Discord Rich Presence
    { 'andweeb/presence.nvim' },

    -- Git Integration
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    -- Colorizer
    { 'norcalli/nvim-colorizer.lua' },

    -- Debugging
    { 'mfussenegger/nvim-dap' },

    {"slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("lackluster")
        -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
        -- vim.cmd.colorscheme("lackluster-mint")
    end,},

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    { 'smithbm2316/centerpad.nvim' },

    -- {
    --   "folke/zen-mode.nvim",
    --   opts = {
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --     gitsigns = { enabled = true }, -- disables git signs
    --     tmux = { enabled = true }, -- disables the tmux statusline
    --     todo = { enabled = true }, -- if set to "true", todo-comments.nvim highlights will be disabled
    --     twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    --   }
    -- },

    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
         }
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

}

local opts = {}

-- Load plugins
require("lazy").setup(plugins, opts)

-- Mason setup
require('mason').setup()

require 'colorizer'.setup()

require('Comment').setup()

-- Set Treesitter compiler
require 'nvim-treesitter.install'.compilers = { "clang" }

