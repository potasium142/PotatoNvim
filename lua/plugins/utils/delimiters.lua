local highlight = {
	"Red",
	"Orange",
	"Yellow",
	"Green",
	"Blue",
}
return {
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	init = function()
		G.rainbow_delimiters = {
			hlgroups = highlight,
			rainbow_delimiters = { highlight = highlight },
		}
	end,
}
