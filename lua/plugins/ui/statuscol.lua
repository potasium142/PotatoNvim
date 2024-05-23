return {
	"luukvbaal/statuscol.nvim",
	enabled = false,
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc, " " } },
				{ text = { builtin.lnumfunc, " " } },
				{
					sign = {
						namespace = { 'Diagnostic' },
					},
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
