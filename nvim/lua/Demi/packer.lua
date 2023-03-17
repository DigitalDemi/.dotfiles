-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'savq/melange',
    as = 'melange',
    config = function()
        vim.cmd('colorscheme melange')
    end
})

  -- Syntax Hightlighting
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  --  File hopping
  use('theprimeagen/harpoon')
  -- undo tree
  use('mbbill/undotree')
  -- Git in vim
  use('tpope/vim-fugitive')
  --  Full Lsp support
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

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
  -- Better vim movement
  use ('dusans/vim-hardmode')

  -- Github copilot
  use ('github/copilot.vim')   

  --  AutoPairs 
  use ('windwp/nvim-autopairs')
  -- Rust lsp
  use ('simrat39/rust-tools.nvim')
  --  Lua Line
  use {'nvim-lualine/lualine.nvim'}
  -- lsp saga
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require("lspsaga").setup({})
      end,
      requires = {
          {"nvim-tree/nvim-web-devicons"},
          --Please make sure you install markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
      }
  })
  use "lukas-reineke/indent-blankline.nvim"

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use 'ryanoasis/vim-devicons'

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
}

end)

