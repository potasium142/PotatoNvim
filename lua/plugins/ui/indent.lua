return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	dependencies = {
		"rainbow-delimiters.nvim",
	},
	opts = {},
	config = function(opts, _)
		local highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		}
		local hooks = require("ibl.hooks")

		require("ibl").setup({
			scope = {
				enabled = true,
				include = {
					node_type = { ["*"] = { "*" } },
				},
				highlight = highlight,
			},
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
