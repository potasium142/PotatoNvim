return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		-- version = "0.7",
		opts = {
			numhl = true,
			signs = {
				add = { text = "║" },
				change = { text = "║" },
				delete = { text = "║" },
				topdelete = { text = "▒ " },
				changedelete = { text = "▓" },
				untracked = { text = "░" },
			},
		},
		keys = function()
			local gs = require("gitsigns")

			return {
				{ "<leader>gd", gs.diffthis },
				{ "<leader>gb", gs.blame },
				{ "<leader>gtb", gs.toggle_current_line_blame },
			}
		end,
	},
}
