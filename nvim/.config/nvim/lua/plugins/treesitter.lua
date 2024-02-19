return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
			-- Additional text objects for treesitter
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "gitignore",
          "graphql",
          "html",
          "query",
          "vimdoc",
          "lua",
          "javascript",
          "json",
          "typescript",
          "tsx",
          "elixir",
          "heex",
          "eex",
          "markdown",
        },
        auto_install = true,
        highlight = {
          enable = true,
          -- I found that some words in the docs do not highlight
          -- See :h neo-tree-commands
          disable = { "vimdoc" }
        },
        indent = { enable = true },
        -- The incremental selection is used while in visual mode
        incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Space>",
						node_incremental = "<C-Space>",
						scope_incremental = "<C-s>",
						node_decremental = "<BS>",
					},
				},
        textobjects = {
          -- See https://www.youtube.com/watch?v=CEMPq_r8UYQ for examples and more configurations
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

							["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
							["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
      })
    end,
  }
}
