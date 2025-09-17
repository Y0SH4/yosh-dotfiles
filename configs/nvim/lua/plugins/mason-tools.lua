return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "shfmt",        -- Shell formatter
        "prettier",     -- JS/TS/CSS/HTML/JSON formatter
        "black",        -- Python formatter
        "stylua",       -- Lua formatter

        -- Linters
        "shellcheck",   -- Shell linter
        "eslint_d",     -- JS/TS linter (daemon version for speed)

        -- Other tools
        "codespell",    -- Spell checker
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
