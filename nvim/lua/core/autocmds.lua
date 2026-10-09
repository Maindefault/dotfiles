local group = vim.api.nvim_create_augroup("UserIndentation", {
    clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = {
        "lua",
        "yaml",
        "json",
        "jsonc",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "terraform",
        "hcl",
    },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "python", "ps1" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "go",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
    end,
})
