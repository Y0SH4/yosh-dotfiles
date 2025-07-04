-- Leader Key Setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable default action of Space in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Alias biar pendek
local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Clear search highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, {
  desc = "Clear search highlight"
}))

-- Diagnostics
keymap("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, {
  desc = "Go to previous diagnostic"
}))
keymap("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, {
  desc = "Go to next diagnostic"
}))
keymap("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
  desc = "Show diagnostic error"
}))
keymap("n", "<leader>q", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, {
  desc = "Open diagnostic quickfix"
}))

-- Terminal: Exit terminal mode with <Esc><Esc>
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", vim.tbl_extend("force", opts, {
  desc = "Exit terminal mode"
}))

-- Buffer navigation (only if BufferLine is available)
pcall(function()
  keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", vim.tbl_extend("force", opts, {
    desc = "Previous buffer"
  }))
  keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", vim.tbl_extend("force", opts, {
    desc = "Next buffer"
  }))
end)
