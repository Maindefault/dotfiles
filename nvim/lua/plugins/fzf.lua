local fzf = require("fzf-lua")
local map = vim.keymap.set

fzf.setup({})

-- File and project search
map("n", "<leader>ff", fzf.files, {
    desc = "Find files",
})

map("n", "<leader>fg", fzf.live_grep, {
    desc = "Find text in project",
})

map("n", "<leader>fb", fzf.buffers, {
    desc = "Find open buffers",
})

map("n", "<leader>fh", fzf.helptags, {
    desc = "Find help topics",
})

map("n", "<leader>fr", fzf.oldfiles, {
    desc = "Find recent files",
})
