local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

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

--  -- file tree
--  use {
--	  'nvim-tree/nvim-tree.lua',
--	  requires = {
--		  'nvim-tree/nvim-web-devicons',
--	  },
--  }

  -- file tree with nnn
  use {
	"luukvbaal/nnn.nvim",
	config = function() require("nnn").setup() end
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
  use { 
          'mfussenegger/nvim-dap',
          requires = {
                  'nvim-neotest/nvim-nio'
          },
  }
  use { 
	  'rcarriga/nvim-dap-ui', 
	  requires = { 
		  'mfussenegger/nvim-dap',
                  'nvim-neotest/nvim-nio'
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

  use {
	  'yorickpeterse/nvim-window',
  }

  use {
	  'folke/noice.nvim',
	  requires = {
		  'MunifTanjim/nui.nvim',
		  'rcarriga/nvim-notify',
	  },
  }


  use 'folke/tokyonight.nvim'

  -- Note taking
  use {
	  'zk-org/zk-nvim',
  }

  use({
    "epwalsh/obsidian.nvim",
    tag = "*",  -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
  })
end)
