-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Kanagawa color palette
local colors = {
  bg = "#1f1f28",
  fg = "#dcd7ba",
  blue = "#7fb4ca",
  purple = "#957fb8",
  yellow = "#e6c384",
  green = "#98bb6c",
  red = "#c34043",
  dark_bg = "#2d2d37",
}

-- Custom highlights for Snacks Explorer with Kanagawa theme
local function setup_snacks_highlights()
  vim.api.nvim_set_hl(0, "SnacksExplorerDir", { fg = colors.blue, bold = true })
  vim.api.nvim_set_hl(0, "SnacksExplorerFile", { fg = colors.fg })
  vim.api.nvim_set_hl(0, "SnacksExplorerIcon", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "SnacksExplorerSelected", { bg = colors.dark_bg, bold = true })
end

-- Apply on VimEnter and ColorScheme
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = vim.api.nvim_create_augroup("snacks_explorer_hl", { clear = true }),
  callback = setup_snacks_highlights,
})

-- Setup immediately
setup_snacks_highlights()
