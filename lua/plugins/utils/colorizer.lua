return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = {
			"*",
			"!neo-tree",
			"!sagaoutline",
			"!alpha",
			"!TelescopePrompt",
		},
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "background",
			sass = { enable = true, parsers = { "css" } },
			always_update = false,
		},
		buftypes = {},
	},
}
