return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					mappings = {
						n = {
							["s"] = actions.select_horizontal,
							["v"] = actions.select_vertical,
							["q"] = actions.close,
							["C-j"] = actions.preview_scrolling_down,
							["<C-k>"] = actions.preview_scrolling_up,
						},
					},
					borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
				},
				extensions = {
					undo = {
						side_by_side = true,
						mappings = {
							n = {
								["<cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			}
		end,
		config = true,
		keys = {
			{ "tsf", "<cmd>Telescope find_files<cr>" },
			{ "tsg", "<cmd>Telescope live_grep<cr>" },
			{ "tsh", "<cmd>Telescope help_tags<cr>" },
			{ "tsm", "<cmd>Telescope marks<cr>" },
		},
	},
}
