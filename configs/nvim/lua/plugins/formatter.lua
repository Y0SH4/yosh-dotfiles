return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    require("conform").setup({
      -- Define formatters
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "eslint", "prettier" },
        typescript = { "eslint", "prettier" },
        javascriptreact = { "eslint", "prettier" },
        typescriptreact = { "eslint", "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        rust = { "rustfmt" },
        python = { "black" },
        go = { "gofmt" },
        sh = { "shfmt" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
      -- Set up format-on-save for *.{js,jsx,ts,tsx,json,lua,rust,py,go} files
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        prettier = {
          prepend_args = { "--print-width", "100", "--tab-width", "2" },
        },
        eslint = {
          command = "eslint",
          args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
          stdin = true,
        },
      },
    })
  end,
}
