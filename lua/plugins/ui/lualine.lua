return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		options = {
			theme = "auto",
			disabled_filetypes = { "alpha" },
			globalstatus = true,
			section_separators = { left = "🭰", right = "🭵" },
			component_separators = "║",
		},
		sections = {
			lualine_b = { "branch", "diff", "diagnostics" },
		},
		extensions = { "neo-tree", "nvim-dap-ui", "lazy", "toggleterm" },

	}
}
