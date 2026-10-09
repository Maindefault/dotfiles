-- Kanagawa theme
local ok, kg = pcall(require, "kanagawa")
if not ok then
  vim.schedule(function()
    vim.notify("kanagawa.nvim kunde inte laddas", vim.log.levels.WARN)
  end)
  return
end

kg.setup({
  compile = true,
  undercurl = true,
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  transparent = not vim.g.neovide,  -- Transparens bara i vanlig Neovim
  dimInactive = false,
  terminalColors = true,
  colors = { palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} } },
  overrides = function(_) return {} end,
  theme = "wave",
  background = { dark = "wave", light = "lotus" },
})

-- vim.cmd.colorscheme("kanagawa")
require("kanagawa").load("wave")
vim.cmd("hi statusline guibg=NONE")
