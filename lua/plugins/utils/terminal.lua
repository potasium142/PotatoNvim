return {
	"numToStr/FTerm.nvim",
	enabled = false,
	name = "FTerm",
	opts = function()
		return {
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		}
	end,
	config = function(_, opts)
		local fterm = require("FTerm")
		fterm.setup(opts)
		vim.keymap.set({ 'n', 't' }, "<C-\\>", fterm.toggle)
	end
}
