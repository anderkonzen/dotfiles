-- Set <Space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader might
--  be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Perl provider (see `:checkhealth`)
vim.g.loaded_perl_provider = 0
