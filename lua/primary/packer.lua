-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  -- Colour scheme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  -- Packege manager (PackerSync)
  use 'wbthomason/packer.nvim'

  -- Telescope (file searching)
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }

 -- Treesitter 
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Harpoon (toggle quick between pages)
  use('theprimeagen/harpoon')

  -- Undo tree
  use('mbbill/undotree')

  -- Vim-fugitive (git tracker)
  use('tpope/vim-fugitive')
end)