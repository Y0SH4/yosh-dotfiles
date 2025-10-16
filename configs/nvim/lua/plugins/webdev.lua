return {
  -- Emmet for HTML/JSX/CSS abbreviations
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
  },

  -- Package.json integration - shows package versions
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = { "json" },
    config = function()
      require("package-info").setup({
        colors = {
          up_to_date = "#3C4048",
          outdated = "#d19a66",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "|  ",
            outdated = "|  ",
          },
        },
        autostart = true,
        hide_up_to_date = false,
        hide_unstable_versions = false,
      })
    end,
    keys = {
      { "<leader>ns", function() require("package-info").show() end, desc = "Show package versions" },
      { "<leader>nc", function() require("package-info").hide() end, desc = "Hide package versions" },
      { "<leader>nt", function() require("package-info").toggle() end, desc = "Toggle package versions" },
      { "<leader>nu", function() require("package-info").update() end, desc = "Update package on line" },
      { "<leader>nd", function() require("package-info").delete() end, desc = "Delete package on line" },
      { "<leader>ni", function() require("package-info").install() end, desc = "Install new package" },
      { "<leader>np", function() require("package-info").change_version() end, desc = "Change package version" },
    },
  },

  -- TypeScript tools - organize imports, update imports, etc.
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      on_attach = function(client, bufnr)
        -- Disable tsserver's formatting (use Prettier instead)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = "all",
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
          allowRenameOfImportPath = false,
        },
      },
    },
    keys = {
      { "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>ts", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
      { "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
      { "<leader>td", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
      { "<leader>ti", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
      { "<leader>tf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
      { "<leader>tr", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
      { "<leader>tF", "<cmd>TSToolsFileReferences<cr>", desc = "File References" },
    },
  },

  -- Auto import for JS/TS
  {
    "stevanmilic/nvim-lspimport",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    keys = {
      { "<leader>im", function() require("lspimport").import() end, desc = "Auto Import" },
    },
  },

  -- Live server for HTML/CSS/JS preview
  {
    "barrett-ruth/live-server.nvim",
    build = "npm install -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
    keys = {
      { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
      { "<leader>lx", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
    },
  },

  -- Better JSX/TSX support with syntax highlighting
  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Highlight CSS colors
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
        virtualtext = "■",
      },
      buftypes = {},
    },
  },

  -- GraphQL support
  {
    "jparise/vim-graphql",
    ft = { "graphql", "gql" },
  },

  -- Markdown preview for documentation
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "mdx" }
    end,
    ft = { "markdown", "mdx" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
    },
  },

  -- JSON tools - better JSON handling
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
    keys = {
      { "<leader>jq", "<cmd>JqxList<cr>", desc = "JQ Query" },
      { "<leader>jf", "<cmd>JqxQuery .<cr>", desc = "Format JSON" },
    },
  },

  -- HTML tag auto close and rename
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "tsx",
      "jsx",
      "xml",
      "php",
      "markdown",
    },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  -- CSS color picker
  {
    "uga-rosa/ccc.nvim",
    ft = { "css", "scss", "sass", "less", "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
      { "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert Color" },
      { "<leader>ch", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Color Highlighter" },
    },
  },

  -- Better terminal for running npm scripts, servers, etc.
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Terminal Vertical" },
    },
  },
}
