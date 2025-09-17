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

-- Clipboard operations
keymap("v", "<leader>y", '"+y', opts)     -- Copy to system clipboard in visual mode
keymap("n", "<leader>Y", '"+yy', opts)    -- Copy line to system clipboard
keymap("n", "<leader>p", '"+p', opts)     -- Paste from system clipboard after cursor
keymap("n", "<leader>P", '"+P', opts)     -- Paste from system clipboard before cursor
keymap("v", "<leader>p", '"+p', opts)     -- Paste from system clipboard in visual mode

-- Buffer/Tab navigation
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)       -- Previous buffer
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)       -- Next buffer
keymap("n", "<leader>c", ":bd<CR>", opts)                    -- Close current buffer
keymap("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts) -- Close other buffers
keymap("n", "<leader>br", ":BufferLineCloseRight<CR>", opts)  -- Close buffers to the right
keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts)   -- Close buffers to the left
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

-- Insert mode: 'jj' or 'jk' to escape
keymap("i", "jj", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

-- Diagnostics
keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
