return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "eslint",
        "lua_ls",
        "html",
        "cssls",
        "rust_analyzer",
        "svelte",
      },
    })
    local lspconfig = require("lspconfig")

    -- Tampilkan diagnostic sebagai virtual text (inline)
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
    lspconfig.ts_ls.setup({})
    lspconfig.eslint.setup({})
    lspconfig.lua_ls.setup({
      settings = {
        Lua = { diagnostics = { globals = { "vim" } } },
      },
    })
    lspconfig.volar.setup({})
    lspconfig.svelte.setup({})
  end,
}
