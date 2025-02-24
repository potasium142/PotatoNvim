return {
	"gbprod/yanky.nvim",
	config = true,
	enabled = false,
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
