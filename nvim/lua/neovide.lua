-- Neovide-specific config
if not vim.g.neovide then
  return
end

-- Helper for transparency
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

vim.g.neovide_opacity = 0.85  -- Unified with content/title
vim.g.neovide_show_border = true
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.g.neovide_remember_window_size = true
vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_confirm_quit = true  -- Safety addition

local function to_hex_color(value)
  return string.format("%06x", value % 0xffffff)
end

-- Title bar (hämta Normal bg efter att colorscheme är laddat)
local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0x0f1117
vim.g.neovide_title_background_color = to_hex_color(normal_bg)
vim.g.neovide_title_text_color = "pink"

-- Font (global, but here for Neovide context)
vim.opt.guifont = "BerkeleyMono Nerd Font:h14"
