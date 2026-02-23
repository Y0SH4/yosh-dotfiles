return {
  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        comments = { italic = true },
        keywords = { italic = true },
        statementhold = { italic = true },
        transparent = false,
        dimInactive = true,
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- Configure LazyVim to use Kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
