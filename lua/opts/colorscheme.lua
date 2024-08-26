local set_gr_hl = require("gtils").set_group_hl
local load_opt = require("gtils").load_opt

local M = {}
M.plugins = {
	{
		"neanias/everforest-nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			italics = false,
			dim_inactive_windows = false,
			background = "hard",
			disable_italic_comment = true,
			diagnostic_text_highlight = true,
			diagnostic_virtual_text = "coloured",
			diagnostic_line_highlight = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)
			require("everforest").load()
		end,
	},
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

			load_opt(opts)

			vim.cmd.colorscheme("sonokai")

			local configuration = vim.fn["sonokai#get_configuration"]()
			local p = vim.fn["sonokai#get_palette"](configuration.style, configuration.colors_override)

			local palette = {
				bg = { sp = p.bg0[1] },
				fg = { sp = p.fg[1] },
				red = { sp = p.red[1] },
				orange = { sp = p.orange[1] },
				yellow = { sp = p.yellow[1] },
				green = { sp = p.green[1] },
				blue = { sp = p.blue[1] },
				purple = { sp = p.purple[1] },
				dim1 = { sp = p.bg1[1] },
				dim2 = { sp = p.bg2[1] },
			}
			set_gr_hl("p_", palette)

			local hls = {
				RainbowDelimiterRed = { fg = p.red[1] },
				RainbowDelimiterYellow = { fg = p.yellow[1] },
				RainbowDelimiterBlue = { fg = p.blue[1] },
				RainbowDelimiterOrange = { fg = p.orange[1] },
				RainbowDelimiterGreen = { fg = p.green[1] },
				RainbowDelimiterViolet = { fg = p.purple[1] },
				RainbowDelimiterCyan = { fg = p.fg[1] },
			}
			set_gr_hl("", hls)
		end,
	},
}
return M
