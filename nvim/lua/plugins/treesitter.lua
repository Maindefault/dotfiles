local ok, treesitter = pcall(require, "nvim-treesitter")

if not ok then
    return
end

treesitter.setup({})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "python",
        "powershell",
        "yaml",
        "json",
    },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
