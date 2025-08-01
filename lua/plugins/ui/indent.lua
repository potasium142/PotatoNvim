return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
	dependencies = {
		"rainbow-delimiters.nvim",
	},
	opts = {
		scope = {
			enabled = true,
			include = {
				node_type = { ["*"] = { "*" } },
			},
			highlight = {

				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
			char = "|",
		},
		indent = {
			char = "|",
		},
	},
	config = function(_, opts)
		local hooks = require("ibl.hooks")

		require("ibl").setup(opts)

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
