return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
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
          "elp",
          "gopls",
          "yamlls",
          "jsonls",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettierd",
          "prettier",
          "stylua",
          "isort",
          "black",
          "pylint",
          "eslint_d",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      -------------------------------------------------
      -- Capabilities
      -------------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
      end

      -------------------------------------------------
      -- Diagnostic Signs
      -------------------------------------------------
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -------------------------------------------------
      -- LspAttach Keymaps
      -------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", {}),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, {
              buffer = event.buf,
              desc = "LSP: " .. desc,
            })
          end

          local tb = require("telescope.builtin")

          map("gd", tb.lsp_definitions, "Goto Definition")
          map("gr", tb.lsp_references, "Goto References")
          map("gI", tb.lsp_implementations, "Goto Implementation")
          map("<leader>D", tb.lsp_type_definitions, "Type Definition")
          map("<leader>ds", tb.lsp_document_symbols, "Document Symbols")
          map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "Workspace Symbols")

          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gD", vim.lsp.buf.declaration, "Declaration")

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({
            group = "UserLspHighlight",
            buffer = event.buf,
          })
        end,
      })

      -------------------------------------------------
      -- Helper (modern 0.11 way)
      -------------------------------------------------
      local function setup(server, opts)
        opts = opts or {}
        opts.capabilities = capabilities
        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end

      -------------------------------------------------
      -- Servers
      -------------------------------------------------

      -- Default servers without overrides
      local default_servers = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "pyright",
        "dockerls",
        "eslint",
        "elp",
        "gopls",
        "yamlls",
      }

      for _, server in ipairs(default_servers) do
        setup(server)
      end

      -- Elixir
      setup("elixirls", {
        filetypes = { "elixir" },
      })

      -- Svelte
      setup("svelte", {
        on_attach = function(client, _)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", {
                uri = vim.uri_from_fname(ctx.match),
              })
            end,
          })
        end,
      })

      -- GraphQL
      setup("graphql", {
        filetypes = {
          "graphql",
          "gql",
          "svelte",
          "typescriptreact",
          "javascriptreact",
        },
      })

      -- Lua
      setup("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      -- JSON
      setup("jsonls", {
        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
        },
      })
    end,
  },
}
