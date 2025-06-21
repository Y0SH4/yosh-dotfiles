return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      -- Toggle comment in normal and visual mode
      map("n", "<C-_>", "gcc", { remap = true, silent = true }) -- Ctrl+/
      map("v", "<C-_>", "gc", { remap = true, silent = true })
    end,
  },
}
