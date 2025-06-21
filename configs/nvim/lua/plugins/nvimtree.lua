return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        filters = {
          dotfiles = false,
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      })
    end,
  }
}

