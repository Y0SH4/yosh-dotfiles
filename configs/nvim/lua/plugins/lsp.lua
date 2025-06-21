return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.emmet_ls.setup({
        filetypes = {
          "html", "css", "scss", "sass",
          "javascript", "javascriptreact",
          "typescript", "typescriptreact"
        }
      })
    end
  }
}

