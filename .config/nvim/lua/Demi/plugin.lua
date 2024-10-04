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
    { "scottmckendry/cyberdream.nvim", priority = 1000 },
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
    {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'windwp/nvim-ts-autotag' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        { "lukas-reineke/indent-blankline.nvim" },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
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
    {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
},
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },
    { 'tribela/vim-transparent' },
    { 'andweeb/presence.nvim' },
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'norcalli/nvim-colorizer.lua' },
    -- Debug
    { 'mfussenegger/nvim-dap' },
     {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },
}

require("lazy").setup(plugins, opts)

require('mason').setup()

require 'nvim-treesitter.install'.compilers = { "clang" }
