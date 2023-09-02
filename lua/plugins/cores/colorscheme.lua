return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	opts = {
		sign_column_background = "grey",
		italics = false,
		disable_italic_comment = true,
		diagnostic_text_highlight = true,
		diagnostic_virtual_text = "coloured",
		diagnostic_line_highlight = true,
	},
	config = function(_, opts)
		require("everforest").setup(opts)
		require("everforest").load()
	end,
}
