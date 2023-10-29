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
						fillchar = "┊",
					},
				},
			},
			ft_ignore = { "sagaoutline", "neo-tree", "Outline", "alpha", "Trouble", "lazy" },
			bt_ignore = {
				"nofile",
			},
		}
	end,
}
