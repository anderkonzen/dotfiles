return {
  -- NOTE: Plugins can also be added by using a table, with the first argument
  -- being the link and the following keys can be used to configure plugin
  -- behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.

  {
    -- "gc" to comment visual regions/lines
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
  },

  {
    -- Add indentation guides even on blank lines
    -- See `:help ibl`
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    keys = {
      { "<Leader>ti", "<Cmd>IBLToggle<CR>", desc = "Toggle indentation lines" },
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

  {
    -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
    keys = {
      -- stylua: ignore start
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<Leader>xt", "<Cmd>Trouble todo toggle<CR>", desc = "Todo (Trouble)" },
      { "<Leader>xT", "<Cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<CR>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<Leader>st", "<Cmd>TodoTelescope<CR>", desc = "Todo" },
      { "<Leader>sT", "<Cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
      -- stylua: ignore end
    },
  },

  {
    -- Autoformat
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
      {
        "<Leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't have
        -- a well standardized coding style. You can add additional languages
        -- here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("nvim-autopairs").setup({})
      -- If you want to automatically add `(` after selecting a function or
      -- method
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    -- Automatically add closing tags
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
