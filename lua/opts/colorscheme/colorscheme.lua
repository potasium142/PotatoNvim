local gtils = require("gtils")

local M = {}

M.plugins = {
	{
		"sainnhe/sonokai",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			local opts = {
				g = {
					sonokai_better_performance = true,
					sonokai_style = "espresso",
					sonokai_disable_italic_comment = true,
					sonokai_diagnostic_text_highlight = true,
					sonokai_diagnostic_line_highlight = true,
					sonokai_diagnostic_virtual_text = "colored",
					sonokai_inlay_hints_background = "dimmed",
				},
			}

			gtils.load_opt(opts)

			vim.cmd.colorscheme("sonokai")

			local configuration = vim.fn["sonokai#get_configuration"]()
			local p = vim.fn["sonokai#get_palette"](configuration.style, configuration.colors_override)
			local palette = {
				p.black[1], --#1c1e1f 1
				p.red[1], --#f76c7c 2
				p.green[1], --#9cd57b 3
				p.yellow[1], --#e3d367 4
				p.blue[1], --#78cee9 5
				p.purple[1], --#baa0f8 6
				p.orange[1], --#f3a96a 7
				p.fg[1], --#e1e2e3 8
				p.black[1], --#1c1e1f 9
				p.red[1], --#f76c7c 10
				p.green[1], --#9cd57b 11
				p.yellow[1], --#e3d367 12
				p.blue[1], --#78cee9 13
				p.purple[1], --#baa0f8 14
				p.orange[1], --#f3a96a 15
				p.fg[1], --#e1e2e3 16
			}
			require("opts.colorscheme.utils").init_global_colors(palette)
		end,
	},
}

return M
