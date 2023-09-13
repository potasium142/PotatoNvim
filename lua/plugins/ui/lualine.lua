return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
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
							modified = icons.buffer.modified,
							readonly = icons.buffer.readonly,
							unnamed = icons.buffer.unnamed,
							newfile = icons.buffer.newfile,
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
