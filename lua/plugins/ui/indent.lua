local highlight = {
	"Red",
	"Orange",
	"Yellow",
	"Green",
	"Blue",
}
return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = false,
	main = "ibl",
	opts = {
		scope = {
			highlight = highlight,
			show_exact_scope = false,
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
