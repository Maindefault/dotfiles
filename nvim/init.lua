vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.autocmds")
require("plugins")
require("core.keymaps")

if vim.g.neovide then
    require("neovide")
end
