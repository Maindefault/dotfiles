local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true, bufnr = bufnr })
end, opts)
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
