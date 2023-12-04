return {
	"gbprod/yanky.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = true,
	keys = {
		{
			"tsy",
			function()
				require("telescope").extensions.yank_history.yank_history()
			end,
		},
		{
			"P",
			"<Plug>(YankyPutBefore)",
			mode = { "n", "x" },
		},
		{
			"p",
			"<Plug>(YankyPutAfter)",
			mode = { "n", "x" },
		},
	},
}
