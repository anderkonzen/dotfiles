local builtin = require('telescope.builtin')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Project Files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Git Files (only versioned files)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Project Search
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

