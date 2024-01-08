return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "query", "vimdoc", "lua", "javascript", "typescript", "elixir", "markdown", "rust" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

