return {
	"numToStr/Navigator.nvim",
	lazy = true,
	config = true,
	keys = {
		{ "<A-h>", "<CMD>NavigatorLeft<CR>", mode = { "n", "t" } },
		{ "<A-l>", "<CMD>NavigatorRight<CR>", mode = { "n", "t" } },
		{ "<A-k>", "<CMD>NavigatorUp<CR>", mode = { "n", "t" } },
		{ "<A-j>", "<CMD>NavigatorDown<CR>", mode = { "n", "t" } },
		{ "<A-p>", "<CMD>NavigatorPrevious<CR>", mode = { "n", "t" } },
	},
}
