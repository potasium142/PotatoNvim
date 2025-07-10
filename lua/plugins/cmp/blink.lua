local icons = require("const.icons_text").kinds
return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = function()
			return {
				keymap = {
					preset = "none",
					["<C-space>"] = {
						"show",
						"show_documentation",
						"hide_documentation",
					},
					["<Enter>"] = {
						"select_and_accept",
						"fallback",
					},
					["<Tab>"] = {
						function(cmp)
							if cmp.snippet_active() then
								return cmp.select_next()
							end
						end,
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
					accept = { auto_brackets = { enabled = true } },
					list = {
						selection = {
							preselect = function(_)
								return not require("blink.cmp").snippet_active({ direction = 1 })
							end,

							auto_insert = false,
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
								},
							},
						},
					},
				},
				appearance = { kind_icons = icons },
			}
		end,
	},
}
