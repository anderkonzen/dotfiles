-- [[ Install `lazy.nvim` plugin manager ]]
--   See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("user.globals")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
require("lazy").setup("plugins", {
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- do not notify when updates are available
  },
  change_detection = {
    notify = false, -- do not notify when config file changes are found
  },
})
