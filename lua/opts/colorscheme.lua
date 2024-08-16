local set_gr_hl = require("gtils").set_group_hl
local get_hl = require("gtils").get_hl
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
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			local p = require("monokai-pro.colorscheme.palette.pro")
			local palette = {
				bg = { sp = p.background },
				fg = { sp = p.text },
				red = { sp = p.accent1 },
				orange = { sp = p.accent2 },
				yellow = { sp = p.accent3 },
				green = { sp = p.accent4 },
				blue = { sp = p.accent5 },
				purple = { sp = p.accent6 },
				dim1 = { sp = p.dimmed1 },
				dim2 = { sp = p.dimmed2 },
				dim3 = { sp = p.dimmed3 },
				dim4 = { sp = p.dimmed4 },
				dim5 = { sp = p.dimmed5 },
			}

			set_gr_hl("p_", palette)

			vim.cmd([[colorscheme monokai-pro]])
		end,
	},
}
return M
