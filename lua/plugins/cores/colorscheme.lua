return {
	{
		"neanias/everforest-nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			italics = false,
			dim_inactive_windows = false,
			background = 'hard',
			disable_italic_comment = true,
			diagnostic_text_highlight = true,
			diagnostic_virtual_text = "coloured",
			diagnostic_line_highlight = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)
			require("everforest").load()
		end,
	},
}
