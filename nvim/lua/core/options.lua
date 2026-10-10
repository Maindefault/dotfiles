local opt = vim.opt

-- Interface
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.showtabline = 2
opt.winborder = "rounded"
opt.termguicolors = true

-- Indentation (default)
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Navigation
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.splitright = true
opt.splitbelow = true

-- Editing
opt.undofile = true
opt.mouse = ""
opt.confirm = true

-- Clipboard
opt.clipboard = ""

-- Responsiveness
opt.updatetime = 250
opt.timeoutlen = 400

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
