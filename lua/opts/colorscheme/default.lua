return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	opts = {
		dim_inactive_windows = false,
		diagnostic_text_highlight = true,
		inlay_hints_background = "dim",
	},
	config = function(_, opts)
		local everforest = require("everforest")

		everforest.setup(opts)
		everforest.load()
	end,
}
