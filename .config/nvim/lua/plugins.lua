return require('packer').startup(function(use)
  -- Configurations

  use 'wbthomason/packer.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  -- Git plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sleuth'
  use 'lewis6991/gitsigns.nvim' 

  -- Whichkey
  use 'folke/which-key.nvim'

  -- file tree
  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons',
	  },
  }

  -- treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
		end,
  }

  -- Telescope fuzzy search
  use {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	requires = { { 'nvim-lua/plenary.nvim' } }
  }


  -- DAP debugging plugin
  use 'mfussenegger/nvim-dap'
  use { 
	  'rcarriga/nvim-dap-ui', 
	  requires = { 
		  'mfussenegger/nvim-dap' 
	  }, 
  }

  -- UI/UX
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
	  'akinsho/bufferline.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use 'folke/tokyonight.nvim'
  --use 'vimpostor/vim-tpipeline'

  -- Dashboard
  use {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function() 
		require('dashboard').setup{
			theme = hyper,
			config = {
				week_header = {
					enable = true,
				},
			},
		}
	end,
	requires = {'nvim-tree/nvim-web-devicons'}
  }



  --use {
--	  'folke/noice.nvim',
--	  requires = {
--		  'MunifTanjim/nui.nvim',
--		  'rcarriga/nvim-notify'
--	  }
 -- }

  -- Note taking
  use { 

	  'renerocksai/telekasten.nvim',
	  requires = {
		  'renerocksai/calendar-vim'
	  }
  }

end)
