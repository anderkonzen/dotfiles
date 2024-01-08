-- Toggles indent lines
-- vim.keymap.set("n", "<leader>it", ":IndentBlanklineToggle<CR>")

-- Strip trailing whitespace
-- vim.keymap.set("n", "<leader>ss", ":StripWhitespace<CR>")

-- Toggles gitsigns
-- vim.keymap.set("n", "<leader>gst", ":Gitsigns toggle_signs<CR>")

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

-- <Tab> / <s-Tab> | Circular windows navigation
vim.keymap.set("n", "<Tab>", "<C-w>w")
vim.keymap.set("n", "<S-Tab>", "<S-w>W")

-- Quickly move between current and last buffers
vim.keymap.set("n", "<Leader><Leader>", ":e#<CR>")

-- Move Lines
vim.keymap.set("n", "<S-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<S-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

