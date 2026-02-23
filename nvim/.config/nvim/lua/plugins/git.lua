return {
  {
    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`. This is equivalent to the following lua:
    --    require('gitsigns').setup({ ... })
    --
    -- See `:help gitsigns` to understand what the configuration keys do

    -- Adds git related signs to the gutter, as well as utilities for managing
    -- changes.
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> • <summary>",
      on_attach = function(buffer)
        local gs = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

        map("n", "<Leader>ghs", gs.stage_hunk, "Stage Hunk")
        map("v", "<Leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")

        map("n", "<Leader>ghr", gs.reset_hunk, "Reset Hunk")
        map("v", "<Leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")

        map("n", "<Leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<Leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<Leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<Leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<Leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")

        map("n", "<Leader>ghd", gs.diffthis, "Diff against index")
        map("n", "<Leader>ghD", function() gs.diffthis("@") end, "Diff against last commit")

        map("n", "<Leader>gb", gs.toggle_current_line_blame, "Toggle show blame line")
        map("n", "<Leader>gD", gs.toggle_deleted, "Toggle show deleted")
        -- stylua: ignore end
      end,
    },
  },

  -- lazygit.nvim removed — using snacks.lazygit instead
}
