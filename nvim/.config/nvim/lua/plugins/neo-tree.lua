return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<Leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Filesystem Explorer",
      },
      {
        "<Leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", position = "float", toggle = true })
        end,
        desc = "Buffers Explorer",
      },
      {
        "-",
        function()
          require("neo-tree.command").execute({ action = "focus", reveal_force_cwd = true })
        end,
        desc = "Reveal File in Explorer",
      }
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          -- When opening a directory, open it with neo-tree instead of netrw
          hijack_netrw_behavior = "open_current"
        }
      })
    end
  }
}
