return {
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
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },
  config = function()
    vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left<cr>")
    vim.keymap.set("n", "<leader>fa", "<cmd>Neotree position=left dir=%:p:h:h reveal_file=%:p<cr>")
    vim.keymap.set('n', '-', "<cmd>Neotree reveal_force_cwd<cr>")
  end,
}
