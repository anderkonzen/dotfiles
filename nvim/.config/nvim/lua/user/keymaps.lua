local nnoremap = require("user.keymaps-utils").nnoremap
local vnoremap = require("user.keymaps-utils").vnoremap
local inoremap = require("user.keymaps-utils").inoremap
local tnoremap = require("user.keymaps-utils").tnoremap
local xnoremap = require("user.keymaps-utils").xnoremap

-- Disable Space bar since it'll be used as the Leader key
nnoremap("<Space>", "<NOP>")

-- Toggles indent lines
-- vim.keymap.set("n", "<Leader>it", ":IndentBlanklineToggle<CR>")

-- Strip trailing whitespace
-- vim.keymap.set("n", "<Leader>ss", ":StripWhitespace<CR>")

-- Toggles gitsigns
-- vim.keymap.set("n", "<Leader>gst", ":Gitsigns toggle_signs<CR>")

-- Save with Leader key
nnoremap("<Leader>w", vim.cmd.update, { silent = false })

-- Toggle show tabs and trailing spaces
nnoremap("<Leader>tt", ":set nolist!<CR>", { desc = "Show/hide tabs and trailing spaces" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and clear search highlights" })

-- Yank from cursor to end of line
nnoremap("Y", "y$", { desc = "Yank from cursor to end of line" })

-- Start a replace command using word under prompt
nnoremap("<Leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

-- Enforce purity
nnoremap("<Left>", "<NOP>")
nnoremap("<Right>", "<NOP>")
nnoremap("<Up>", "<NOP>")
nnoremap("<Down>", "<NOP>")

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
nnoremap("<C-h>", "<C-w>h", { desc = "Go to left window"})
nnoremap("<C-j>", "<C-w>j", { desc = "Go to lower window"})
nnoremap("<C-k>", "<C-w>k", { desc = "Go to upper window"})
nnoremap("<C-l>", "<C-w>l", { desc = "Go to right window"})

inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<NOP>")

-- <Tab> / <s-Tab> | Circular windows navigation
nnoremap("<Tab>", "<C-w>w")
nnoremap("<S-Tab>", "<S-w>W")

-- Quickly move between current and last buffers
nnoremap("<Leader><Leader>", ":e#<CR>")

-- Move Lines
nnoremap("<S-Down>", "<cmd>m .+1<CR>==", { desc = "Move down" })
nnoremap("<S-Up>", "<cmd>m .-2<CR>==", { desc = "Move up" })
inoremap("<S-Down>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
inoremap("<S-Up>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
vnoremap("<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vnoremap("<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

