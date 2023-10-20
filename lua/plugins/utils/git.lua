return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		version = "0.6",
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "🮸" },
				changedelete = { text = "~" },
				untracked = { text = "│" },
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = {
			"DiffviewOpen",
			"DiffviewToggleFiles",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
}
