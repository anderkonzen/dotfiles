-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up and down when line is highlighted
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Keep cursor at the beginning when pulling lines from below
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching, keep found item in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When pasting with this map, keep pasted value in the paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Toggles indent lines
vim.keymap.set("n", "<leader>it", ":IndentBlanklineToggle<CR>")

-- Strip trailing whitespace
vim.keymap.set("n", "<leader>ss", ":StripWhitespace<CR>")

-- Toggles gitsigns
vim.keymap.set("n", "<leader>gst", ":Gitsigns toggle_signs<CR>")

-- C-s save file
vim.keymap.set({ "i", "n" }, "<C-s>", vim.cmd.update)

-- Toggle show tabs and trailing spaces
vim.keymap.set("n", "<leader>tt", ":set nolist!<CR>", { silent = true })

-- Clear last search
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "y$")

-- Start a replace command using word under prompt
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

-- Enforce purity
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- Format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- <Tab> / <s-Tab> | Circular windows navigation
vim.keymap.set("n", "<Tab>", "<C-w>w")
vim.keymap.set("n", "<S-Tab>", "<S-w>W")

-- Quickly move between current and last buffers
vim.keymap.set("n", "<Leader><Leader>", ":e#<CR>")

