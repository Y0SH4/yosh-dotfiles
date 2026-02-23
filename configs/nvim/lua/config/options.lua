-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_rocks = false

-- Enable ligatures support
vim.opt.guifont = "Cascadia Code NF:h11"

-- Disable inlay hints by default for a cleaner view
vim.lsp.inlay_hint.enable(false)
