local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
    local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = desc,
        })
    end

    map("gd", function()
    require("fzf-lua").lsp_definitions()
    end, "LSP: Go to definition")    
    map("gD", function()
    require("fzf-lua").lsp_declarations()
    end, "LSP: Go to declaration")
    map("gi", function()
    require("fzf-lua").lsp_implementations()
    end, "LSP: Go to implementation")
    map("K", vim.lsp.buf.hover, "LSP: Hover documentation")
    map("<leader>cs", function()
    require("fzf-lua").lsp_references()
    end, "LSP: Find references")

    map("<leader>cr", vim.lsp.buf.rename, "LSP: Rename symbol")
    map("<leader>ca", function()
    require("fzf-lua").lsp_code_actions()
    end, "LSP: Code action")

    map("<leader>cf", function()
        vim.lsp.buf.format({
            async = false,
            bufnr = bufnr,
        })
    end, "LSP: Format buffer")
end

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = { enable = false },
    },
  },
})

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
    "bashls",
    "jsonls",
    "yamlls",
    "rust_analyzer",
  },
})
