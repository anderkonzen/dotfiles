local config = function()
  require("lualine").setup({
    sections = {
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        "encoding",
        "fileformat",
        "filetype",
      },
    },
    options = {
      theme = "catppuccin",
      globalstatus = true,
      component_separators = "|",
      section_separators = "",
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
