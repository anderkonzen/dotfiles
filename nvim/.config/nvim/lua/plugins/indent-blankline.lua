return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {},
    keys = {
      { "<Leader>it", "<Cmd>IBLToggle<CR>", desc = "Toggle indent-blankline on and off" } 
    },
    config = function()
      require("ibl").setup({
        debounce = 100,
        indent = { char = "┊" },
        scope = {
          enabled = false,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}

