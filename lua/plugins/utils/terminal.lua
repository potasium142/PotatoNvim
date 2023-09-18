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
			"<space>lg",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

				lazygit:toggle()
			end,
		},
		{
			"<C-\\>",
			"<cmd>ToggleTerm<cr>",
		},
	},
}
