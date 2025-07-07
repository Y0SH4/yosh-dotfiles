return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"lua_ls",
				"html",
				"cssls",
        "rust_analyzer",
			},
		})
		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({})
		lspconfig.eslint.setup({})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = { diagnostics = { globals = { "vim" } } },
			},
		})
	end,
}
