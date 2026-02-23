return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Replaces alpha-nvim
    dashboard = {
      enabled = true,
    },
    -- Replaces indent-blankline.nvim
    indent = {
      enabled = true,
      indent = {
        char = "┊",
      },
      scope = {
        enabled = true,
      },
    },
    -- Replaces lazygit.nvim
    lazygit = {
      enabled = true,
    },
    -- Replaces fidget.nvim
    notifier = {
      enabled = true,
    },
  },
  keys = {
    -- stylua: ignore start
    { "<Leader>l", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<Leader>ti", function() Snacks.indent.enable() end, desc = "Toggle indentation lines" },
    -- stylua: ignore end
  },
}
