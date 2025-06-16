return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        -- Web development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        
        -- Rust (using rustfmt from rustup)
        rust = { "rustfmt" },
        
        -- Lua
        lua = { "stylua" },
      },
      
      formatters = {
        -- Configure rustfmt to use rustup
        rustfmt = {
          command = "rustup",
          args = { "run", "stable", "rustfmt", "--edition=2021", "--emit=stdout" },
        },
      },
      
      -- Format on save
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
