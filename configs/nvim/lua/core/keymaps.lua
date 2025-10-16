local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)      -- Ctrl+S to save
keymap("i", "<C-s>", "<Esc>:w<CR>", opts) -- Ctrl+S to save in insert mode
keymap("n", "<leader>x", ":q<CR>", opts)
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

-- Navigation (Jump List)
keymap("n", "<C-o>", "<C-o>", opts) -- Jump back to previous location
keymap("n", "<C-i>", "<C-i>", opts) -- Jump forward to next location
keymap("n", "gb", "<C-o>", opts)    -- Go back (alternative to Ctrl+O)
keymap("n", "gf", "<C-i>", opts)    -- Go forward (alternative to Ctrl+I)

-- LSP References and Symbols
keymap("n", "gr", vim.lsp.buf.references, opts)              -- Go to references
keymap("n", "<leader>s", vim.lsp.buf.document_symbol, opts)  -- Document symbols
keymap("n", "<leader>S", vim.lsp.buf.workspace_symbol, opts) -- Workspace symbols

-- Formatting
keymap("n", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, opts)
keymap("v", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, opts)

-- Clipboard operations
keymap("v", "<leader>y", '"+y', opts)  -- Copy to system clipboard in visual mode
keymap("n", "<leader>Y", '"+yy', opts) -- Copy line to system clipboard
keymap("n", "<leader>p", '"+p', opts)  -- Paste from system clipboard after cursor
keymap("n", "<leader>P", '"+P', opts)  -- Paste from system clipboard before cursor
keymap("v", "<leader>p", '"+p', opts)  -- Paste from system clipboard in visual mode

-- Buffer/Tab navigation
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)        -- Previous buffer
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)        -- Next buffer
keymap("n", "<leader>c", ":bd<CR>", opts)                     -- Close current buffer
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
keymap("n", "<leader>dq", vim.diagnostic.setloclist, opts)

-- Enhanced Telescope keybindings
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)              -- Recent files
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)           -- Colorschemes
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)               -- Keymaps
keymap("n", "<leader>fm", ":Telescope marks<CR>", opts)                 -- Marks
keymap("n", "<leader>fj", ":Telescope jumplist<CR>", opts)              -- Jump list
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)  -- Document symbols
keymap("n", "<leader>fS", ":Telescope lsp_workspace_symbols<CR>", opts) -- Workspace symbols

-- Todo comments
keymap("n", "]t", function() require("todo-comments").jump_next() end, opts)
keymap("n", "[t", function() require("todo-comments").jump_prev() end, opts)
keymap("n", "<leader>ft", ":TodoTelescope<CR>", opts)

-- Session management
keymap("n", "<leader>ss", function() require("persistence").load() end, opts)                -- Restore session
keymap("n", "<leader>sl", function() require("persistence").load({ last = true }) end, opts) -- Last session
keymap("n", "<leader>sd", function() require("persistence").stop() end, opts)                -- Don't save session

-- Smart splits (window navigation and resizing)
keymap("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, opts)
keymap("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, opts)
keymap("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, opts)
keymap("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, opts)

-- Window resizing
keymap("n", "<A-h>", function() require("smart-splits").resize_left() end, opts)
keymap("n", "<A-j>", function() require("smart-splits").resize_down() end, opts)
keymap("n", "<A-k>", function() require("smart-splits").resize_up() end, opts)
keymap("n", "<A-l>", function() require("smart-splits").resize_right() end, opts)

-- Text manipulation with mini.move (Alt + hjkl)
-- These are handled by the plugin configuration

-- Better increment/decrement (enhanced by dial.nvim)
-- <C-a> and <C-x> are handled by the plugin

-- Multiple cursors (vim-visual-multi)
-- <C-n> for multiple cursors is handled by the plugin

-- Terminal (ToggleTerm) - handled by plugin keymaps
-- <C-\> to toggle terminal
-- <leader>tf for float, <leader>th for horizontal, <leader>tv for vertical
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Escape terminal mode
