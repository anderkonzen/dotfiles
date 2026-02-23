return {
  {
    -- Fuzzy finder (replaces telescope.nvim)
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "FzfLua",
    keys = {
      -- Search
      { "<Leader>sa", "<Cmd>FzfLua autocmds<CR>", desc = "Auto Commands" },
      { "<Leader>:", "<Cmd>FzfLua command_history<CR>", desc = "Command History" },
      { "<Leader>sC", "<Cmd>FzfLua commands<CR>", desc = "Commands" },
      { "<Leader>sh", "<Cmd>FzfLua helptags<CR>", desc = "Help" },
      { "<Leader>sk", "<Cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
      { "<Leader>sf", "<Cmd>FzfLua files<CR>", desc = "Files" },
      { "<Leader>sw", "<Cmd>FzfLua grep_cword<CR>", desc = "Search current word" },
      { "<Leader>sg", "<Cmd>FzfLua live_grep<CR>", desc = "Grep" },
      { "<Leader>xd", "<Cmd>FzfLua diagnostics_document<CR>", desc = "Document Diagnostics" },
      { "<Leader>xD", "<Cmd>FzfLua diagnostics_workspace<CR>", desc = "Workspace Diagnostics" },
      { "<Leader>sr", "<Cmd>FzfLua resume<CR>", desc = "Resume" },

      -- Buffer search
      { "<Leader>/", "<Cmd>FzfLua lgrep_curbuf<CR>", desc = "Fuzzily search in current buffer" },
      { "<Leader>s/", "<Cmd>FzfLua live_grep_glob<CR>", desc = "Search with glob filter" },

      -- Find/files
      { "<Leader><Leader>", "<Cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<Leader>s.", "<Cmd>FzfLua oldfiles<CR>", desc = "Recent Files" },
      { "<Leader>gf", "<Cmd>FzfLua git_files<CR>", desc = "Find Files (git-files)" },
      {
        "<Leader>sn",
        function()
          require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Neovim Files",
      },

      -- Git
      { "<Leader>gc", "<Cmd>FzfLua git_commits<CR>", desc = "Commits" },
      { "<Leader>gs", "<Cmd>FzfLua git_status<CR>", desc = "Status" },
    },
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)
      -- Register as vim.ui.select handler (replaces telescope-ui-select)
      fzf.register_ui_select()
    end,
    opts = {
      defaults = {
        formatter = "path.filename_first",
      },
      files = {
        hidden = true,
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    },
  },
}
