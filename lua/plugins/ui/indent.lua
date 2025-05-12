return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
	dependencies = {
		"rainbow-delimiters.nvim",
	},
	opts = function()
		local highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		}
		return {
			scope = {
				enabled = true,
				include = {
					node_type = { ["*"] = { "*" } },
				},
				highlight = highlight,
			},
			indent = { char = "🭰" },
		}
	end,
	config = function(_, opts)
		local hooks = require("ibl.hooks")

		require("ibl").setup(opts)

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
