return {
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	init = function()
		vim.g.rainbow_delimiters = {
			rainbow_delimiters = { highlight = highlight },
		}
	end,
}
