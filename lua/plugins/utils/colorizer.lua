return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = {
			"*",
			"!NeoTree",
			"!Outline",
			"!alpha",
			"!TelescopePrompt",
		},
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			-- red, blue,green,yellow ,#a7c080
			mode = "background",
			sass = { enable = false, parsers = { "css" }, },
			virtualtext = "",
			always_update = false
		},
		buftypes = {},
	}
}
