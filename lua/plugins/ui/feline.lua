return {
	"freddiehaddad/feline.nvim",
	opts = {},
	enabled = true,
	dependencies = {
		"neanias/everforest-nvim",
	},
	config = function()
		local icons = require("config.icons")
		local feline = require("feline")
		local palette = require("everforest.colours").generate_palette(require("everforest").config, vim.o.background)

		local colors = {
			fg = palette.fg,
			bg = palette.bg0,
			black = palette.bg_dim,
			skyblue = palette.blue,
			cyan = palette.aqua,
			green = palette.green,
			oceanblue = palette.blue,
			magenta = palette.purple,
			orange = palette.orange,
			red = palette.red,
			violet = palette.purple,
			white = palette.fg,
			yellow = palette.yellow,
			----------------
			bg_skyblue = palette.bg_blue,
			bg_cyan = palette.bg_blue,
			bg_green = palette.bg_green,
			bg_oceanblue = palette.bg_blue,
			bg_magenta = palette.bg_red,
			bg_red = palette.bg_red,
			bg_violet = palette.bg_visual,
			bg_visual = palette.bg_visual,
			bg_yellow = palette.bg_yellow,
			bg_blue = palette.bg_blue,
		}

		local modes = setmetatable({
			["n"] = "N",
			["no"] = "N",
			["v"] = "V",
			["s"] = "S",
			["i"] = "I",
			["ic"] = "I",
			["R"] = "R",
			["c"] = "C",
			["ce"] = "X",
			["r"] = "P",
			["rm"] = "M",
			["r?"] = "C",
			["t"] = "T",
			["S"] = "SL",
			["V"] = "VL",
			[""] = "VB",
			[""] = "SB",
			["Rv"] = "VR",
			["cv"] = "EX",
			["!"] = "SH",
		}, {
			__index = function()
				return "-"
			end,
		})

		local seperator = {
			provider = " ",
		}

		local vim_mode = {
			mode_name = {
				provider = {
					name = "vi_mode",
					opts = {
						show_mode_name = true,
					},
				},
				icon = "",
				hl = function()
					return {
						fg = "fg",
						bg = "bg_" .. require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
				left_sep = "block",
				right_sep = "block",
			},
			neovim_icon = {
				provider = "   ",
				hl = function()
					return {
						fg = "bg",
						bg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
			},
		}

		local git = {
			branch = {
				provider = "git_branch",
				icon = icons.git.Branch .. " ",
				hl = {
					fg = "bg",
					bg = "yellow",
				},
				left_sep = "block",
				right_sep = "block",
			},
			add = {
				provider = "git_diff_added",
				icon = icons.git.LineAdded,
				hl = {
					fg = "green",
					bg = "bg_yellow",
				},
				left_sep = "block",
				right_sep = "block",
			},
			change = {
				provider = "git_diff_changed",
				icon = icons.git.LineModified,
				hl = {
					fg = "orange",
					bg = "bg_yellow",
				},

				left_sep = "block",
				right_sep = "block",
			},
			remove = {
				provider = "git_diff_removed",
				icon = icons.git.LineRemoved,
				hl = {
					fg = "red",
					bg = "bg_yellow",
				},

				left_sep = "block",
				right_sep = "block",
			},
		}

		local position = {
			provider = {
				name = "position",
				opts = {
					format = "  {line}:{col} ",
				},
			},
			hl = {
				bg = "bg_yellow",
			},
		}
		local line_percentage = {
			provider = "line_percentage",
			hl = {
				fg = "bg",
				bg = "yellow",
			},
			left_sep = "block",
			right_sep = "block",
		}

		local file = {
			type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
						colored_icon = false,
					},
				},
				hl = {
					fg = "bg",
					bg = "skyblue",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			name = {
				provider = function()
					return vim.fn.expand("%:t:r")
				end,
				hl = {
					bg = "bg_blue",
				},
				left_sep = "block",
				right_sep = "block",
			},
			encoding = {
				provider = "file_encoding",
				hl = {
					bg = "bg_visual",
				},
				left_sep = "block",
				right_sep = "block",
			},
			format = {
				provider = "file_format",
				hl = {
					bg = "red",
					fg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
		}

		local left = {
			seperator,
			vim_mode.neovim_icon,
			vim_mode.mode_name,
			seperator,
			git.branch,
			git.add,
			git.change,
			git.remove,
			seperator,
			file.type,
			file.name,
			seperator,
		}
		local middle = {}
		local right = {
			seperator,
			file.encoding,
			file.format,
			seperator,
			position,
			line_percentage,
			seperator,
		}
		local components = {
			active = {
				left,
				middle,
				right,
			},
			inactive = {
				{
					seperator,
					file.type,
				},
				{},
				{},
			},
		}

		feline.setup({
			theme = colors,
			components = components,
			force_inactive = {
				buftypes = {
					"nofile",
					"terminal",
					"prompt",
				},
			},
		})
	end,
}
