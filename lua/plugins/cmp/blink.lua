local icons = require("const.icons_text").kinds
return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = {
					"snippet_forward",
					"select_next",
					"fallback",
				},
				["<S-Tab>"] = {
					"snippet_backward",
					"select_prev",
					"fallback",
				},
				["<C-k>"] = {
					"scroll_documentation_up",
					"fallback",
				},
				["<C-j>"] = {
					"scroll_documentation_down",
					"fallback",
				},
				["<ESC>"] = { "hide", "fallback" },
			},
			signature = { enabled = true },
			completion = {
				list = {
					selection = {
						preselect = true,
					},
				},
				menu = {
					draw = {
						columns = {
							{
								"kind_icon",
							},
							{
								"label",
								gap = 1,
							},
						},
					},
				},
			},
			appearance = { kind_icons = icons },
		},
	},
}
