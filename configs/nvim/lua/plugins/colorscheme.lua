return {
  -- Add Vitesse colorscheme
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    opts = {
      variant = "dark-soft", -- Use dark-soft variant
    },
    config = function(_, opts)
      require("vitesse").setup(opts)
      vim.cmd.colorscheme("vitesse")
    end,
  },

  -- Configure LazyVim to use Vitesse Dark Soft
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vitesse",
    },
  },
}
