vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NvimTree toggle & window navigation
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)  -- Toggle explorer
map("n", "<C-h>", "<C-w>h", opts)                   -- Move to left window (explorer)
map("n", "<C-l>", "<C-w>l", opts)                   -- Move to right window (editor)

-- Save and quit
map("n", "<C-s>", ":w<CR>", opts)                   -- Save file
map("n", "<C-q>", ":q<CR>", opts)                   -- Quit window

-- Format document (using LSP)
map("n", "<C-S-f>", function() vim.lsp.buf.format() end, opts)

-- Telescope keymaps
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Comment.nvim toggle comment (normal & visual modes)
map("n", "<C-_>", "gcc", { remap = true, silent = true })
map("v", "<C-_>", "gc", { remap = true, silent = true })

