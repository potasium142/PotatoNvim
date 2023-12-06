return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	opts = {
		direction = "float",
		open_mapping = [[<C-\>]],
		float_opts = {
			border = "double",
		},
	},
	keys = {
		{
			"<C-\\>",
			"<cmd>ToggleTerm<cr>",
		},
	},
}
