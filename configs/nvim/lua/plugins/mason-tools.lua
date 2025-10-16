return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters (Web Development)
        "prettier",       -- JS/TS/CSS/HTML/JSON/YAML/Markdown formatter
        "prettierd",      -- Prettier daemon for faster formatting
        "stylua",         -- Lua formatter
        "shfmt",          -- Shell formatter
        "black",          -- Python formatter
        "taplo",          -- TOML formatter
        
        -- Linters (Web Development)
        "eslint_d",       -- JS/TS linter (daemon version)
        "stylelint",      -- CSS/SCSS linter
        "shellcheck",     -- Shell linter
        "jsonlint",       -- JSON linter
        "markdownlint",   -- Markdown linter
        "yamllint",       -- YAML linter
        "hadolint",       -- Dockerfile linter
        
        -- Other Tools
        "codespell",      -- Spell checker
        "js-debug-adapter", -- JavaScript debugger
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
