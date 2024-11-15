local gtils = require("gtils")

local M = {}

M.plugins = {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			local opts = {
				g = {
					gruvbox_material_better_performance = true,
					-- gruvbox_material_foreground = "mix",
					gruvbox_material_disable_italic_comment = true,
					gruvbox_material_diagnostic_text_highlight = true,
					gruvbox_material_diagnostic_line_highlight = true,
					gruvbox_material_diagnostic_virtual_text = "colored",
					gruvbox_material_inlay_hints_background = "dimmed",
					gruvbox_material_background = "soft",
				},
				o = {
					background = "light",
				},
			}

			gtils.load_opt(opts)

			vim.cmd.colorscheme("gruvbox-material")
			local config = vim.fn["gruvbox_material#get_configuration"]()
			local p =
				vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
			-- local p = vim.fn["gruvbox-material#get_palette"](configuration.style, configuration.colors_override)
			local palette = {
				p.bg0[1], --1
				p.red[1], --2
				p.green[1], --3
				p.yellow[1], --4
				p.blue[1], --5
				p.purple[1], --6
				p.orange[1], --7
				p.fg0[1], --8
				p.bg0[1], --9
				p.red[1], --10
				p.green[1], --11
				p.yellow[1], --12
				p.blue[1], --13
				p.purple[1], --14
				p.orange[1], --15
				p.fg0[1], --16
			}
			require("opts.colorscheme.utils").init_global_colors(palette)
		end,
	},
}

return M
