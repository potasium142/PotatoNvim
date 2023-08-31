return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = false,
	opts = {
		space_char_blankline = " ",
		show_end_of_line = true,
		filetype_exclude = { "dashboard", "alpha", "TelescopePrompt" },
		context_highlight_list = {
			'Red',
			'Orange',
			'Yellow',
			'Green',
			'Blue',
		},
		show_current_context = true,
		show_current_context_start = true,
	}
}
