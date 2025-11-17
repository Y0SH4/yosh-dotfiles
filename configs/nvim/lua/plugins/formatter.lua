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
        -- Web Development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        astro = { "prettier" },
        
        -- Markup & Styling
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        sass = { "prettier" },
        less = { "prettier" },
        
        -- Data & Config
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        toml = { "taplo" },
        
        -- Markdown
        markdown = { "prettier" },
        mdx = { "prettier" },
        
        -- GraphQL
        graphql = { "prettier" },
        
        -- Other Languages
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "black" },
        go = { "gofmt", "goimports" },
        sh = { "shfmt" },
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
        prettier = {
          prepend_args = { 
            "--print-width", "100",
            "--tab-width", "2",
            "--trailing-comma", "es5",
            "--semi",
          },
        },
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
      },
    })
  end,
}
