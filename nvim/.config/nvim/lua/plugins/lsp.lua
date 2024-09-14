return {
  -- Brief aside: **What is LSP?**
  --
  -- LSP is an initialism you've probably heard, but might not understand what
  -- it is.
  --
  -- LSP stands for Language Server Protocol. It's a protocol that helps
  -- editors and language tooling communicate in a standardized fashion.
  --
  -- In general, you have a "server" which is some tool built to understand a
  -- particular language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.).
  -- These Language Servers (sometimes called LSP servers, but that's kind of
  -- like ATM Machine) are standalone processes that communicate with some
  -- "client" - in this case, Neovim!
  --
  -- LSP provides Neovim with features like:
  --  - Go to definition
  --  - Find references
  --  - Autocompletion
  --  - Symbol Search
  --  - and more!
  --
  -- Thus, Language Servers are external tools that must be installed
  -- separately from Neovim. This is where `mason` and related plugins come
  -- into play.
  --
  -- If you're wondering about lsp vs treesitter, you can check out the
  -- wonderfully and elegantly composed help section, `:help lsp-vs-treesitter`

  {
    -- Ensure the servers and tools are installed.
    -- To check the current status of installed tools and/or manually install
    -- other tools, you can run
    --    :Mason
    --
    -- You can press `g?` for help in this menu.
    "williamboman/mason.nvim",
    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason_lspconfig.setup({
        -- List of servers for mason to install
        ensure_installed = {
          "ts_ls", -- javascript, typescript
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "graphql",
          "pyright",
          "dockerls",
          "eslint",
          "elixirls",
          "elp", -- erlang
          "gopls",
          "yamlls",
          "jsonls",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettierd", -- prettier formatter
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint", -- python linter
          "eslint_d", -- javascript linter
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- This function gets run when an LSP attaches to a particular buffer.
      -- That is to say, every time a new file is opened that is associated
      -- with an LSP (for example, opening `main.rs` is associated with
      -- `rust_analyzer`) this function will be executed to configure the
      -- current buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", {}),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as
          -- such it is possible to define small helper and utility functions
          -- so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define
          -- mappings specific for LSP related items. It sets the mode, buffer
          -- and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          -- This is where a variable was first declared, or where a function
          -- is defined, etc.
          -- To jump back, press <C-t>.
          map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")

          -- Find references for the word under your cursor.
          map("gr", require("telescope.builtin").lsp_references, "Goto References")

          -- Jump to the implementation of the word under your cursor.
          -- Useful when your language has ways of declaring types without an
          -- actual implementation.
          map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")

          -- Jump to the type of the word under your cursor.
          -- Useful when you're not sure what type a variable is and you want
          -- to see the definition of its *type*, not where it was *defined*.
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Jump to Type Definition")

          -- Fuzzy find all the symbols in your current document.
          -- Symbols are things like variables, functions, types, etc.
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Search Document Symbols")

          -- Fuzzy find all the symbols in your current workspace.
          -- Similar to document symbols, except searches over your entire
          -- project.
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Search Workspace Symbols")

          -- Rename the variable under your cursor.
          -- Most Language Servers support renaming across files, etc.
          map("<leader>rn", vim.lsp.buf.rename, "Rename variable")

          -- Execute a code action, usually your cursor needs to be on top of
          -- an error or a suggestion from your LSP for this to activate.
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

          -- Opens a popup that displays documentation about the word under
          -- your cursor.
          -- See `:help K` for why this keymap.
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          -- For example, in C this would take you to the header.
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")

          -- The following two autocommands are used to highlight references of
          -- the word under your cursor when your cursor rests there for a
          -- little while.
          -- See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the
          -- second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "UserLspHighlight", buffer = event.buf })
        end,
      })

      -- LSP servers and clients are able to communicate to each other what
      -- features they support.
      -- By default, Neovim doesn't support everything that is in the LSP
      -- specification. When you add nvim-cmp, luasnip, etc. Neovim now has
      -- *more* capabilities. So, we create new capabilities with nvim cmp, and
      -- then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

      -- Change the diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      mason_lspconfig.setup_handlers({
        -- The first entry (without a key) will be the default handler and will
        -- be called for each installed server that doesn't have a dedicated
        -- handler.
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
        ["elixirls"] = function()
          lspconfig["elixirls"].setup({
            filetypes = { "elixir" },
          })
        end,
        ["svelte"] = function()
          -- configure svelte server
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            ---@diagnostic disable-next-line: unused-local
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  -- Here use ctx.match instead of ctx.file
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,
        ["graphql"] = function()
          -- configure graphql language server
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          })
        end,
        ["jsonls"] = function()
          lspconfig["jsonls"].setup({
            settings = {
              json = {
                format = { enable = true },
                validate = { enable = true },
              },
            },
          })
        end,
      })
    end,
  },
}
