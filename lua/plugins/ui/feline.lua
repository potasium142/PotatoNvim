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
			bg_orange = palette.bg_visual,
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

		local seperator = {
			blank = { provider = " " },
			cleft = { provider = "[" },
			cright = { provider = "]" }
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
						-- bg = "bg_" .. require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
				right_sep = " ",
			},
			neovim_icon = {
				provider = "  ",
				hl = function()
					return {
						-- fg = "bg",
						-- bg = require("feline.providers.vi_mode").get_mode_color(),
						fg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
				left_sep = " "
			},
		}

		local git = {
			branch = {
				provider = "git_branch",
				icon = icons.git.Branch .. " ",
				hl = {
					-- fg = "bg",
					fg = "yellow",
				},
				left_sep = " ",
				right_sep = " ",
			},
			add = {
				provider = "git_diff_added",
				icon = icons.git.LineAdded,
				hl = {
					fg = "green",
				},
				right_sep = " ",
			},
			change = {
				provider = "git_diff_changed",
				icon = icons.git.LineModified,
				hl = {
					fg = "orange",
				},
				right_sep = " ",
			},
			remove = {
				provider = "git_diff_removed",
				icon = icons.git.LineRemoved,
				hl = {
					fg = "red",
				},
				right_sep = " ",
			},
		}

		local position = {
			provider = {
				name = "position",
				opts = {
					format = " {line}:{col} ",
				},
			},
		}
		local line_percentage = {
			provider = "line_percentage",
			hl = {
				fg = "yellow",
			},
		}

		local file = {
			type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
						colored_icon = true,
					},
				},
				hl = {
					-- fg = "bg",
					fg = "skyblue",
					style = "bold",
				},
				left_sep = " "
			},
			name = {
				provider = function()
					return vim.fn.expand("%:t:r")
				end,
				right_sep = " "
			},
			encoding = {
				provider = "file_encoding",
				hl = {
					fg = "fg",
				},
			},
			format = {
				provider = "file_format",
				hl = {
					fg = "red",
				},
			},
		}

		local left = {
			seperator.blank,
			seperator.cleft,
			vim_mode.neovim_icon,
			vim_mode.mode_name,
			seperator.cright,
			seperator.blank,
			seperator.cleft,
			git.branch,
			git.add,
			git.change,
			git.remove,
			seperator.cright,
			seperator.blank,
			seperator.cleft,
			file.type,
			seperator.blank,
			file.name,
			seperator.cright,
		}
		local middle = {}
		local right = {
			seperator.cleft,
			seperator.blank,
			file.encoding,
			seperator.blank,
			file.format,
			seperator.blank,
			seperator.cright,
			seperator.blank,
			seperator.cleft,
			seperator.blank,
			position,
			line_percentage,
			seperator.blank,
			seperator.cright,
			seperator.blank,
		}
		local components = {
			active = {
				left,
				middle,
				right,
			},
			inactive = {
				{
					seperator.cleft,
					file.type,
					seperator.blank,
					seperator.cright
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
