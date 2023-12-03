return {
	"numToStr/Comment.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("Comment").setup()
	end,
}
