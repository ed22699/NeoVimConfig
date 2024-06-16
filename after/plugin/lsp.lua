local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
      buffer = bufnr,
      preserve_mappings = false
  })
end)

-- here you can setup the language servers
-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig').lua_ls.setup({})
      require('lspconfig').csharp_ls.setup({})
      require('lspconfig').typos_lsp.setup({})
      require('lspconfig').marksman.setup({})
      require('lspconfig').html.setup({})
      require('lspconfig').ltex.setup({})
      require('lspconfig').texlab.setup({})
      require('lspconfig').cssls.setup({})
    end,
  },
})

-- turn off diagnostics in gutter
vim.diagnostic.config({
  signs = false
})
