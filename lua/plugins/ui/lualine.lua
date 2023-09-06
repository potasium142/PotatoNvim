return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			theme = "auto",
			disabled_filetypes = { "alpha" },
			globalstatus = true,
			section_separators = { left = "🮌", right = "🮍" },
			component_separators = "",
		},
		sections = {
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					symbols = {
						error = " ",
						warn = " ",
						hint = " ",
						info = " ",
					},
				},
			},
			lualine_c = {
				{
					"filetype",
					icon_only = true,
				},
				{
					"filename",
					symbols = {
						modified = "",
						readonly = "󰌾",
						unnamed = "",
						newfile = "󰝒",
					},
				},
			},
			lualine_x = { { "encoding", fmt = string.upper }, "fileformat" },
		},
		inactive_tabline = {
			lualine_z = { "tabs" },
		},
		extensions = { "neo-tree", "nvim-dap-ui", "lazy", "toggleterm" },
	},
}
