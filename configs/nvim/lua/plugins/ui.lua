return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({ style = "darker" })
			require("onedark").load()
		end,
	},
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					max_name_length = 18,
					max_prefix_length = 15,
					truncate_names = true,
					tab_size = 21,
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false,
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					separator_style = "slant",
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					sort_by = "id",
				},
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
