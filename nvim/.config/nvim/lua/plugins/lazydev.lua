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
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
      -- disable when a .luarc.json file is found
      enabled = function(root_dir)
        return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
      end,
    },
  },
  -- optional `vim.uv` typings
  { "Bilal2453/luvit-meta", lazy = true },
}
