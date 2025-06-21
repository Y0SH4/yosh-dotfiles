return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      })

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
      map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
      map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
      map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
    end,
  },
}
