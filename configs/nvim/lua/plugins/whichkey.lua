return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({})
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\\x16]*",
      callback = function()
        vim.b.which_key_block = true
      end,
    })
  end
}
