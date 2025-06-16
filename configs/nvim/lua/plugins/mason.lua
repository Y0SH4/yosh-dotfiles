return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    ---@diagnostic disable-next-line: missing-parameter
    opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
      -- Formatters
      "prettier",
      "stylua",

      -- Linters
      "eslint_d",
      "shellcheck",
      "jsonlint",
      "markdownlint",

      -- Language servers
      "rust-analyzer",
      "typescript-language-server",
      "css-lsp",
      "html-lsp",
      "tailwindcss-language-server",
      "emmet-ls",
      "json-lsp",
      "lua-language-server",

      -- Debug adapters
      "codelldb",
      "chrome-debug-adapter",
    })
  end,
}
