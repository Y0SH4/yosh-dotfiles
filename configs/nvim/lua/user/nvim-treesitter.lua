local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "markdown",
    "tsx",
    "typescript",
    "javascript",
    "toml",
    "c_sharp",
    "json",
    "yaml",
    "rust",
    "css",
    "html",
    "lua",
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    query = 'rainbow-parens',
    strategy = require 'ts-rainbow.strategy.global',
    max_file_lines = 3000,
    extended_mode = false,
  },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx", "lua" }
