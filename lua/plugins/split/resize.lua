return {
	{
		"kwkarlwang/bufresize.nvim",
		lazy = true,
		enabled = true,
		event = {
			"VimResized",
		},
		config = function(_, opts)
			require("bufresize").setup(opts)
		end,
	},
}
