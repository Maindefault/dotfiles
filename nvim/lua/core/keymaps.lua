local map = vim.keymap.set

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlighting",
})

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Window resizing
map("n", "<leader>H", "<cmd>vertical resize -2<CR>", {
    desc = "Decrease window width",
})

map("n", "<leader>L", "<cmd>vertical resize +2<CR>", {
    desc = "Increase window width",
})

map("n", "<leader>J", "<cmd>resize +2<CR>", {
    desc = "Increase window height",
})

map("n", "<leader>K", "<cmd>resize -2<CR>", {
    desc = "Decrease window height",
})

-- Save
map("n", "<leader>w", "<cmd>write<CR>", {
    desc = "Save file",
})

-- Keep selection when indenting
map("x", "<", "<gv", { desc = "Indent left" })
map("x", ">", ">gv", { desc = "Indent right" })
