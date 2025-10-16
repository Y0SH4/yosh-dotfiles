return {
  -- Linting plugin
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure linters by filetype (only use linters that are actually installed)
      lint.linters_by_ft = {
        -- JavaScript/TypeScript linting via LSP (eslint) is better
        -- We'll use nvim-lint only for other file types
        markdown = { "markdownlint" },
        dockerfile = { "hadolint" },
      }

      -- Auto-lint on save only
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = lint_augroup,
        callback = function()
          -- Only lint if linter is configured for this filetype
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint()
          end
        end,
      })

      -- Manual lint keymap
      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
