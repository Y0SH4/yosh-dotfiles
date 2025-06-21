return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    lazy = false,         -- agar dimuat saat startup
    priority = 1000,      -- load lebih awal sebelum plugin lain
    config = function()
      vim.o.termguicolors = true
      vim.cmd("colorscheme vitesse")
    end,
  }
}
