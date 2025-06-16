return {
  -- Rust specific configuration
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended to pin to a tag
    ft = { "rust" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Configure rustaceanvim
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          hover_actions = {
            auto_focus = true,
          },
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
          },
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Enable inlay hints
            if vim.fn.has("nvim-0.10") == 1 then
              vim.lsp.inlay_hint.enable(bufnr, true)
            end

            -- Set keymaps
            vim.keymap.set("n", "K", function() vim.cmd.RustLsp("hover") end, { buffer = bufnr, desc = "Hover" })
            vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, { buffer = bufnr, desc = "Code Action" })
            vim.keymap.set("n", "<leader>dr", function() vim.cmd.RustLsp("debuggables") end, { buffer = bufnr, desc = "Rust Debuggables" })
            vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, { buffer = bufnr, desc = "Rust Runnables" })
            vim.keymap.set("n", "<leader>re", function() vim.cmd.RustLsp("expandMacro") end, { buffer = bufnr, desc = "Expand Macro" })
            vim.keymap.set("n", "<leader>rp", function() vim.cmd.RustLsp("parentModule") end, { buffer = bufnr, desc = "Parent Module" })
          end,
          settings = {
            -- rust-analyzer settings
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              -- Use rustfmt from rustup
              rustfmt = {
                overrideCommand = {
                  "rustup", "run", "stable", "rustfmt", "--edition=2021", "--"
                },
              },
            },
          },
        },
        -- DAP configuration
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      }
    end,
  },

  -- Crates plugin for managing Rust dependencies
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("crates").setup(opts)
    end,
  },

  -- Add Rust debugging support
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },
}
