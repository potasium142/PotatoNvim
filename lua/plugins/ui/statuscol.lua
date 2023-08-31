return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = false,
			segments = {
				{ text = { builtin.foldfunc, " " } },
				{ text = { builtin.lnumfunc, " " } },
				{
					sign = { name = { "Diagnostic" } },
				},
				{
					sign = {
						name = { ".*" },
						maxwidth = 1,
						colwidth = 1,
						fillchar = "│",
					},
				}
			},
			ft_ignore = { "neo-tree", "Outline", "alpha", "Trouble", "lazy" },
		}
	end
}
