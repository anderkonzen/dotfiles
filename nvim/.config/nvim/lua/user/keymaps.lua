-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search with <esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Left>", '<Cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<Right>", '<Cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<Up>", '<Cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<Down>", '<Cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Save with Leader key or <C-s>
vim.keymap.set("n", "<Leader>w", vim.cmd.update)
vim.keymap.set("n", "<C-s>", vim.cmd.update)

-- Toggle show tabs and trailing spaces
vim.keymap.set(
  "n",
  "<Leader>tt",
  ":set nolist!<CR>",
  { silent = true, desc = "Toggle tabs and trailing spaces on or off" }
)

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank from cursor to end of line" })

-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- I'm too fast
vim.keymap.set("n", "Q", "<NOP>")

-- -- <Tab> / <s-Tab> | Circular windows navigation
-- TODO: S-Tab does not work
-- vim.keymap.set("n", "<Tab>", "<C-w>w")
-- vim.keymap.set("n", "<S-Tab>", "<S-w>W")

-- Quickly move between current and last buffers
vim.keymap.set("n", "<Leader><Leader>", ":e#<CR>")

-- Move Lines
vim.keymap.set("n", "<S-Down>", "<Cmd>m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("n", "<S-Up>", "<Cmd>m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("i", "<S-Down>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("i", "<S-Up>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Indenting with tab/shift-tab in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
