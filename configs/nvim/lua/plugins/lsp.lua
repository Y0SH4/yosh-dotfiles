return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim", -- JSON schemas
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",           -- TypeScript/JavaScript
        "eslint",          -- ESLint
        "lua_ls",          -- Lua
        "html",            -- HTML
        "cssls",           -- CSS
        "tailwindcss",     -- Tailwind CSS
        "emmet_ls",        -- Emmet
        "jsonls",          -- JSON
        "graphql",         -- GraphQL
        "rust_analyzer",   -- Rust
        "svelte",          -- Svelte
        "astro",           -- Astro
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
    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup({})
    
    -- ESLint
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
    
    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = { 
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })
    
    -- HTML
    lspconfig.html.setup({
      filetypes = { "html", "htmldjango", "blade" },
    })
    
    -- CSS
    lspconfig.cssls.setup({
      settings = {
        css = { validate = true, lint = { unknownAtRules = "ignore" } },
        scss = { validate = true, lint = { unknownAtRules = "ignore" } },
        less = { validate = true, lint = { unknownAtRules = "ignore" } },
      },
    })
    
    -- Tailwind CSS
    lspconfig.tailwindcss.setup({
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "astro",
      },
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            },
          },
        },
      },
    })
    
    -- Emmet
    lspconfig.emmet_ls.setup({
      filetypes = {
        "html",
        "css",
        "scss",
        "sass",
        "less",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "astro",
      },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      },
    })
    
    -- JSON
    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
    
    -- GraphQL
    lspconfig.graphql.setup({
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    })
    
    -- Svelte
    lspconfig.svelte.setup({})
    
    -- Astro
    lspconfig.astro.setup({})
  end,
}
