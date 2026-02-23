return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    -- Enhanced explorer configuration with OneDark styling
    explorer = {
      enabled = true,
      show_hidden = true,
      indent = {
        guides = "│ ",
      },
      icons = {
        folder_open = "󰉋",
        folder = "󰉋",
        file = "󰈙",
      },
    },
  },
}
