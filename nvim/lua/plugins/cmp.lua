local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
    }),
})
