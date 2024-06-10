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
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        -- ["gs"] = { name = "+surround" },
        ["z"] = { name = "+fold" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        -- ["<leader><tab>"] = { name = "+tabs" },
        -- ["<leader>b"] = { name = "+buffer" },
        -- ["<leader>c"] = { name = "+code" },
        -- ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks", _ = "which_key_ignore" },
        -- ["<leader>q"] = { name = "+quit/session" },
        -- ["<leader>s"] = { name = "+search" },
        -- ["<leader>u"] = { name = "+ui" },
        -- ["<leader>w"] = { name = "+windows" },
        -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>d"] = { name = "[D]ocument" },
        ["<leader>r"] = { name = "[R]ename" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>w"] = { name = "[W]orkspace" },
        ["<leader>t"] = { name = "+toggle" },
        ["<leader>h"] = { name = "Git [H]unk" },
      },
    },
    config = function(_, opts) -- This is the function that runs, AFTER loading
      local wk = require("which-key")
      wk.setup(opts)

      -- Document existing key chains
      wk.register(opts.defaults)
      -- visual mode
      wk.register({
        ["<leader>h"] = { "Git [H]unk" },
      }, { mode = "v" })
    end,
  },
}
