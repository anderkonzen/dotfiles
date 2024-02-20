return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "elixirls", "tsserver" },
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   lazy = false,
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp"
  --   },
  --   config = function()
  --     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --       border = "rounded",
  --     })
  --
  --     local capabilities = require("cmp_nvim_lsp").default_capabilities()
  --
  --     local lspconfig = require("lspconfig")
  --     lspconfig.lua_ls.setup({
  --       capabilities = capabilities,
  --     })
  --     lspconfig.elixirls.setup({
  --       cmd = { "elixir-ls" },
  --       capabilities = capabilities,
  --     })
  --     lspconfig.tsserver.setup({
  --       capabilities = capabilities,
  --     })
  --
  --     vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  --     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
  --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  --
  --     vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
  --   end,
  -- },
}

