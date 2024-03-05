return {
  {
    -- Browse the file system and other tree like structures
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    -- Keymaps can also be configured with Lazy with the `keys` table.
    keys = {
      { "<Leader>nf", "<Cmd>Neotree toggle<CR>", desc = "[F]ile Explorer" },
      -- You can pass a function to the mapping function
      {
        "<Leader>nb",
        function()
          require("neo-tree.command").execute({ source = "buffers", position = "float", toggle = true })
        end,
        desc = "[B]uffers Explorer",
      },
      {
        "-",
        function()
          require("neo-tree.command").execute({ action = "focus", reveal_force_cwd = true })
        end,
        desc = "Reveal file in Neotree",
      },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          -- When opening a directory, open it with neo-tree instead of netrw
          hijack_netrw_behavior = "open_current",
        },
        source_selector = {
          winbar = true,
          statusline = false,
        },
      })
    end,
  },

  {
    -- Adds support for file operations using built-in LSP support
    -- TODO: Test this plugin
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
