return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "css", "javascript", "typescript", "lua" },
        highlight = { enable = true },
      })
    end
  }
}
