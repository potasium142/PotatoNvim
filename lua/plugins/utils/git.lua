return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			signs = {
				add = { text = "║" },
				change = { text = "┇" },
				delete = { text = "╏" },
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
