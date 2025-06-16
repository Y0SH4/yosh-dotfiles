return {
  -- Enhanced TypeScript support
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        -- Specify TypeScript server settings
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "relative",
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- Tailwind CSS support
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true,
  },

  -- Emmet support for HTML/CSS
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
  },

  -- CSS color highlighting
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
        css = true,
        css_variables = true,
        sass = { enable = true, parsers = { "css" }, },
      },
    },
  },

  -- Formatting is now handled by the dedicated conform.lua configuration

  -- ESLint integration
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        svelte = { "eslint" },
      },
    },
  },

  -- HTML tag auto-closing
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
