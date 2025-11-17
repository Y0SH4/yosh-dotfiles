return {
    {
        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",
        opts = {
            keymap = { preset = "default" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono"
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                -- Prioritize LSP and reduce buffer noise
                providers = {
                    lsp = {
                        name = "LSP",
                        module = "blink.cmp.sources.lsp",
                        score_offset = 10, -- Higher priority
                    },
                    path = {
                        name = "Path",
                        module = "blink.cmp.sources.path",
                        score_offset = 5,
                        opts = {
                            trailing_slash = false,
                            label_trailing_slash = true,
                        }
                    },
                    snippets = {
                        name = "Snippets",
                        module = "blink.cmp.sources.snippets",
                        score_offset = 3,
                    },
                    buffer = {
                        name = "Buffer",
                        module = "blink.cmp.sources.buffer",
                        score_offset = -3, -- Lower priority
                        opts = {
                            -- Only suggest words that appear multiple times
                            get_bufnrs = function()
                                return { vim.api.nvim_get_current_buf() }
                            end,
                        }
                    },
                }
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 100, -- Faster docs
                },
                ghost_text = {
                    enabled = false, -- Disable to reduce confusion
                },
                keyword = {
                    range = "full",
                },
            },
            signature = { enabled = true }
        },
        opts_extend = { "sources.default" }
    }
}
