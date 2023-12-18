return {
	"luukvbaal/statuscol.nvim",
	enabled = true,
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc, " " } },
				{ text = { builtin.lnumfunc, " " } },
				{
					sign = { name = { "Diagnostic" } },
				},
				{
					sign = {
						namespace = { ".*" },
						maxwidth = 1,
						colwidth = 1,
						fillchar = "┃",
					},
				},
			},
			bt_ignore = {
				"nofile",
			},
		}
	end,
}
