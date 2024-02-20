-- Disable Space bar since it'll be used as the Leader key
vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true})

-- Strip trailing whitespace
-- vim.keymap.set("n", "<Leader>ss", ":StripWhitespace<CR>")

-- Toggles gitsigns
-- vim.keymap.set("n", "<Leader>gst", ":Gitsigns toggle_signs<CR>")

-- Save with Leader key or <C-s>
vim.keymap.set("n", "<Leader>w", vim.cmd.update)
vim.keymap.set("n", "<C-s>", vim.cmd.update)

-- Toggle show tabs and trailing spaces
vim.keymap.set("n", "<Leader>tt", ":set nolist!<CR>", { desc = "Toggle tabs and trailing spaces on or off" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and clear search highlights" })

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank from cursor to end of line" })

-- Start a replace command using word under prompt
vim.keymap.set("n", "<Leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

-- Enforce purity
vim.keymap.set("n", "<Left>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Right>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Up>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Down>", "<NOP>", { noremap = true })

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window"})

-- <C-c> also exits insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- I'm too fast 
vim.keymap.set("n", "Q", "<NOP>")

-- <Tab> / <s-Tab> | Circular windows navigation
vim.keymap.set("n", "<Tab>", "<C-w>w")
vim.keymap.set("n", "<S-Tab>", "<S-w>W")

-- Quickly move between current and last buffers
vim.keymap.set("n", "<Leader><Leader>", ":e#<CR>")

-- Move Lines
vim.keymap.set("n", "<S-Down>", "<Cmd>m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("n", "<S-Up>", "<Cmd>m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("i", "<S-Down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("i", "<S-Up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

vim.keymap.set("v", "<Tab>", ">gv", { noremap = true})
vim.keymap.set("v", ">", ">gv", { noremap = true})
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true})
vim.keymap.set("v", "<", "<gv", { noremap = true})
