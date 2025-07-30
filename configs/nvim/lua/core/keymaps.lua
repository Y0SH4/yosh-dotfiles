local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)      -- Ctrl+S to save
keymap("i", "<C-s>", "<Esc>:w<CR>", opts) -- Ctrl+S to save in insert mode
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- File Explorer Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Formatting
keymap("n", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, opts)

-- Insert mode: 'jj' or 'jk' to escape
keymap("i", "jj", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

-- Diagnostics
keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
