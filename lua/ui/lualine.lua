return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		options = {
			theme = "auto",
			disabled_filetypes = { "alpha" },
			globalstatus = true,
			section_separators = "",
			component_separators = "",
		},
		sections = {
			lualine_b = { "branch", "diff", "diagnostics" },
		},
		extensions = { "neo-tree", "nvim-dap-ui", "lazy" },
	}
}
