return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tsserver",
        "cssls",
        "html",
        "tailwindcss",
        "jsonls",
        "emmet_ls",
      },
      automatic_installation = true,
    },
  },
}
