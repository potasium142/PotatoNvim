return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		local icons = require("config.icons")
		return {
			options = {
				theme = "auto",
				disabled_filetypes = { "alpha" },
				globalstatus = true,
				-- section_separators = { left = "🮌", right = "🮍" },
				component_separators = "",
			},
			sections = {
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = {
							added = icons.git.LineAdded,
							modified = icons.git.LineModified,
							removed = icons.git.LineRemoved,
						},
					},
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							hint = icons.diagnostics.Hint,
							info = icons.diagnostics.Info,
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
							modified = icons.buffer.Modified,
							readonly = icons.buffer.Readonly,
							unnamed = icons.buffer.Unnamed,
							newfile = icons.buffer.Newfile,
						},
					},
				},
				lualine_x = { { "encoding", fmt = string.upper }, "fileformat" },
			},
			inactive_tabline = {
				lualine_z = { "tabs" },
			},
			extensions = { "nvim-tree", "nvim-dap-ui", "lazy", "toggleterm" },
		}
	end,
}
