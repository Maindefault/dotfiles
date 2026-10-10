local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

local luasnip = require("luasnip")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
        border = "rounded",
        max_height = 10,
        max_width = 60,
        scrollbar = false,
    }),
    documentation = cmp.config.window.bordered({
        border = "rounded",
        max_height = 15,
        max_width = 60,
    }),
},

formatting = {
    format = function(entry, item)
        local kinds = {
            Function = "Fn",
            Method = "Method",
            Variable = "Var",
            Field = "Field",
            Property = "Prop",
            Keyword = "Keyword",
            Snippet = "Snippet",
            Class = "Class",
            Module = "Module",
        }

        item.kind = kinds[item.kind] or item.kind
        item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            luasnip = "[Snippet]",
        })[entry.source.name]

        return item
    end,
},
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),

    ["<CR>"] = cmp.mapping.confirm({ select = false }),
}),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
    }),
})
