-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Left>", '<Cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<Right>", '<Cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<Up>", '<Cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<Down>", '<Cmd>echo "Use j to move!!"<CR>')

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Keybinds to make split navigation easier
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move Lines
vim.keymap.set("n", "<S-Down>", "<Cmd>m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("n", "<S-Up>", "<Cmd>m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("i", "<S-Down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("i", "<S-Up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Buffers
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search highlight with <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save <C-s>
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.update)

-- Better indenting in visual mode
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank from cursor to end of line" })

-- Toggle show tabs and trailing spaces
vim.keymap.set("n", "<Leader>tt", ":set nolist!<CR>", { silent = true, desc = "[T]oggle [t]abs and trailing spaces" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit
-- easier for people to discover. Otherwise, you normally need to press
-- <C-\><C-n>, which is not what someone will guess without a bit more
-- experience.
--
--  NOTE: This won't work in all terminal emulators/tmux/etc. Try your own
--  mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
