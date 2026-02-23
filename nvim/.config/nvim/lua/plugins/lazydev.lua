return {
  -- Properly configures LuaLS for editing your Neovim config
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    cmd = "LazyDev",
    opts = {
      library = {
        -- Only load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  -- optional `vim.uv` typings
  { "Bilal2453/luvit-meta", lazy = true },
}
