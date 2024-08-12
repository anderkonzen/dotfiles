-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don"t need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--    event = "VimEnter"
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--    config = function() ... end

return {
  {
    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to "VimEnter"
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts) -- This is the function that runs, AFTER loading
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        {
          mode = { "n", "v" }, -- NORMAL and VISUAL mode
          { "g", desc = "goto" },

          { "z", desc = "fold" },
          { "]", desc = "next" },
          { "[", desc = "prev" },

          { "<Leader>g", group = "git" },
          { "<Leader>gh", group = "hunks" },
          { "<Leader>f", group = "file" },
          { "<Leader>c", group = "code" },
          { "<Leader>x", group = "diagnostics/quickfix" },
          { "<Leader>d", group = "document" },
          { "<Leader>r", group = "rename" },
          { "<Leader>s", group = "search" },
          { "<Leader>w", group = "workspace" },
          { "<Leader>t", group = "toggle" },
        },
      })
    end,
  },
}
