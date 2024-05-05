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
    -- Package manager (PackerSync)
    use 'wbthomason/packer.nvim'

    -- Telescope (file searching)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')

    -- Harpoon (toggle quick between pages)
    use('theprimeagen/harpoon')

    -- Undo tree
    use('mbbill/undotree')

    -- Hardtime improve workflow
    use {
        "m4xshen/hardtime.nvim",
        dependencies = { "/nui.nvim", "nvim-lua/plenary.nvim" },
    }

    -- Vim-fugitive (git tracker)
    use('tpope/vim-fugitive')

    --git gutter
    use('airblade/vim-gitgutter')

    -- Todo comments
    use{
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }
    --lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons'}
    }

    -- markdown preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- nvimTree
    use('nvim-tree/nvim-tree.lua')

    -- Mason
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
end)
