return require('packer').startup(function(use)
 	use { "ellisonleao/gruvbox.nvim" }	
	use 'xiyaowong/nvim-transparent'
	use 'lewis6991/impatient.nvim'
	use 'wbthomason/packer.nvim'
	use 'hrsh7th/vim-vsnip'
	use 'andweeb/presence.nvim'

	use {
  		'VonHeikemen/lsp-zero.nvim',
  	requires = {
    		-- LSP Support
    		{'neovim/nvim-lspconfig'},
    		{ "williamboman/mason.nvim" },

    		-- Autocompletion
    		{'hrsh7th/nvim-cmp'},
    		{'hrsh7th/cmp-buffer'},
    		{'hrsh7th/cmp-path'},
    		{'saadparwaiz1/cmp_luasnip'},
    		{'hrsh7th/cmp-nvim-lsp'},
    		{'hrsh7th/cmp-nvim-lua'},

    		-- Snippets
    		{'L3MON4D3/LuaSnip'},
    		{'rafamadriz/friendly-snippets'},
  }
}


use {

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    
}

	use 'nvim-treesitter/nvim-treesitter'
	use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  	require("toggleterm").setup()
	end}

	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

	use "terrortylor/nvim-comment"
	require('nvim_comment').setup()
	use "rafamadriz/friendly-snippets"

	use 'Pocco81/auto-save.nvim'

	use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	use {
        'hoob3rt/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

	use {
		"nvim-neo-tree/neo-tree.nvim",
		  branch = "v2.x",
		  requires = { 
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		  }
		}

	use 'tiagovla/scope.nvim'
	use 'mfussenegger/nvim-dap'
	use 'simrat39/rust-tools.nvim'
    use'manzeloth/live-server'
end)
