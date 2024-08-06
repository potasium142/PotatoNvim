local border = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" }
return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/noice.nvim",
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
							["<C-j>"] = actions.preview_scrolling_down,
							["<C-k>"] = actions.preview_scrolling_up,
							["<C-h>"] = actions.preview_scrolling_left,
							["<C-l>"] = actions.preview_scrolling_right,
						},
						i = {
							["<C-j>"] = actions.preview_scrolling_down,
							["<C-k>"] = actions.preview_scrolling_up,
							["<C-h>"] = actions.preview_scrolling_left,
							["<C-l>"] = actions.preview_scrolling_right,
						},
					},
					borderchars = {
						prompt = border,
						preview = border,
						results = border,
					},
					layout_config = {
						horizontal = {
							width = 0.9,
							preview_width = 0.6,
						},
					},
				},
			}
		end,
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{
					"tsf",
					builtin.find_files,
				},
				{
					"tsg",
					builtin.live_grep,
				},
				{
					"tsh",
					builtin.help_tags,
				},
				{
					"tsm",
					builtin.marks,
				},
				{
					"tsr",
					builtin.resume,
				},
			}
		end,
	},
}
