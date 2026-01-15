return {
  {
    "stevearc/conform.nvim",
    opts = {

      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        solidity = { "prettier" },
        rust = { "rustfmt" },
      },
    },
  },
}
