local gtils = require("gtils")
local sysvar = require("const.sys_var")

local M = {}

M.plugins = {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		enabled = not sysvar.IS_TTY,
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
	{
		"morhetz/gruvbox",
		enabled = false,
		config = function()
			local opts = {
				g = {},
				o = {
					background = "light",
				},
			}
			gtils.load_opt(opts)
			vim.cmd.colorscheme("gruvbox")

			local set_hl = vim.api.nvim_set_hl

			set_hl(0, "GlobalBase0", { link = "GruvboxBg0" })
			set_hl(0, "GlobalBase1", { link = "GruvboxRed" })
			set_hl(0, "GlobalBase2", { link = "GruvboxGreen" })
			set_hl(0, "GlobalBase3", { link = "GruvboxYellow" })
			set_hl(0, "GlobalBase4", { link = "GruvboxPurple" })
			set_hl(0, "GlobalBase5", { link = "GruvboxAqua" })
			set_hl(0, "GlobalBase6", { link = "GruvboxOrange" })
			set_hl(0, "GlobalBase7", { link = "GruvboxFg0" })
			set_hl(0, "GlobalBase8", { link = "GruvboxBg0" })
			set_hl(0, "GlobalBase9", { link = "GruvboxRed" })
			set_hl(0, "GlobalBase10", { link = "GruvboxGreen" })
			set_hl(0, "GlobalBase11", { link = "GruvboxYellow" })
			set_hl(0, "GlobalBase12", { link = "GruvboxPurple" })
			set_hl(0, "GlobalBase13", { link = "GruvboxAqua" })
			set_hl(0, "GlobalBase14", { link = "GruvboxOrange" })
			set_hl(0, "GlobalBase15", { link = "GruvboxFg0" })

			set_hl(0, "GlobalBase0I", { link = "GruvboxBg0Sign" })
			set_hl(0, "GlobalBase1I", { link = "GruvboxRedSign" })
			set_hl(0, "GlobalBase2I", { link = "GruvboxGreenSign" })
			set_hl(0, "GlobalBase3I", { link = "GruvboxYellowSign" })
			set_hl(0, "GlobalBase4I", { link = "GruvboxPurpleSign" })
			set_hl(0, "GlobalBase5I", { link = "GruvboxAquaSign" })
			set_hl(0, "GlobalBase6I", { link = "GruvboxOrangeSign" })
			set_hl(0, "GlobalBase7I", { link = "GruvboxFg0Sign" })
			set_hl(0, "GlobalBase8I", { link = "GruvboxBg0Sign" })
			set_hl(0, "GlobalBase9I", { link = "GruvboxRedSign" })
			set_hl(0, "GlobalBase10I", { link = "GruvboxGreenSign" })
			set_hl(0, "GlobalBase11I", { link = "GruvboxYellowSign" })
			set_hl(0, "GlobalBase12I", { link = "GruvboxPurpleSign" })
			set_hl(0, "GlobalBase13I", { link = "GruvboxAquaSign" })
			set_hl(0, "GlobalBase14I", { link = "GruvboxOrangeSign" })
			set_hl(0, "GlobalBase15I", { link = "GruvboxFg0Sign" })
		end,
	},
}

return M
