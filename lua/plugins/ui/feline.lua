local get_hl = require("gtils").get_hl
return {
	"freddiehaddad/feline.nvim",
	opts = {},
	enabled = true,
	dependencies = {
		"neanias/everforest-nvim",
	},
	config = function()
		local icons = require("const.icons")
		local feline = require("feline")

		local seperator = {
			provider = " ",
		}

		local p = {
			bg = get_hl("p_bg", "sp"),
			fg = get_hl("p_fg", "sp"),
			red = get_hl("p_red", "sp"),
			orange = get_hl("p_orange", "sp"),
			yellow = get_hl("p_yellow", "sp"),
			green = get_hl("p_green", "sp"),
			blue = get_hl("p_blue", "sp"),
			purple = get_hl("p_purple", "sp"),
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
						fg = require("feline.providers.vi_mode").get_mode_color(),
						bg = "bg",
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
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			add = {
				provider = "git_diff_added",
				icon = icons.git.LineAdded,
				hl = {
					fg = "green",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
			change = {
				provider = "git_diff_changed",
				icon = icons.git.LineModified,
				hl = {
					fg = "orange",
					bg = "bg",
				},

				left_sep = "block",
				right_sep = "block",
			},
			remove = {
				provider = "git_diff_removed",
				icon = icons.git.LineRemoved,
				hl = {
					fg = "red",
					bg = "bg",
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
				fg = "orange",
				bg = "bg",
			},
		}
		local line_percentage = {
			provider = "line_percentage",
			hl = {
				fg = "bg",
				bg = "orange",
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
					bg = "blue",
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
					bg = "bg",
					fg = "blue",
				},
				left_sep = "block",
				right_sep = "block",
			},
			encoding = {
				provider = "file_encoding",
				hl = {
					fg = "red",
					bg = "bg",
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
			theme = p,
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
