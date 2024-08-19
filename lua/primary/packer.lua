-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -- sticky-notes my own plugin 
    use ("ed22699/sticky-notes.nvim")


    -- Colour scheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Session manager 
    use("folke/persistence.nvim")

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

    -- Vim-fugitive (git tracker)
    use('tpope/vim-fugitive')

    -- autoclose
    use 'm4xshen/autoclose.nvim'

    --git gutter
    use('airblade/vim-gitgutter')

    -- Todo comments
    use{
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }

    -- comments
    use ( 'numToStr/Comment.nvim' )

    -- autotag
    use('windwp/nvim-ts-autotag')

    -- navigate windows easier
    use('christoomey/vim-tmux-navigator')

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
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {"saadparwaiz1/cmp_luasnip"},
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            { 'L3MON4D3/LuaSnip',
            {"rafamadriz/friendly-snippets"},
            },
        }
    }
    use { "kkharji/sqlite.lua" }
    -- VimTex
    use {'lervag/vimtex'}
end)
