local get_hl = require("gtils").get_hl
return {
	"freddiehaddad/feline.nvim",
	opts = {},
	enabled = true,
	config = function()
		local icons = require("const.icons")
		local feline = require("feline")

		local seperator = {
			provider = " ",
		}

		local p = {
			bg = get_hl("g_1", "sp"),
			bg_dim = get_hl("g_2", "sp"),
			red = get_hl("p_10", "sp"),
			green = get_hl("p_11", "sp"),
			yellow = get_hl("p_12", "sp"),
			blue = get_hl("p_13", "sp"),
			purple = get_hl("p_14", "sp"),
			aqua = get_hl("p_15", "sp"),
			fg = get_hl("p_16", "sp"),
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
						bg = "bg_dim",
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
						fg = "bg_dim",
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
					fg = "bg_dim",
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
					bg = "bg_dim",
				},
				left_sep = "block",
				right_sep = "block",
			},
			change = {
				provider = "git_diff_changed",
				icon = icons.git.LineModified,
				hl = {
					fg = "aqua",
					bg = "bg_dim",
				},

				left_sep = "block",
				right_sep = "block",
			},
			remove = {
				provider = "git_diff_removed",
				icon = icons.git.LineRemoved,
				hl = {
					fg = "red",
					bg = "bg_dim",
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
				fg = "aqua",
				bg = "bg_dim",
			},
		}
		local line_percentage = {
			provider = "line_percentage",
			hl = {
				fg = "bg_dim",
				bg = "aqua",
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
					fg = "bg_dim",
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
					bg = "bg_dim",
					fg = "blue",
				},
				left_sep = "block",
				right_sep = "block",
			},
			encoding = {
				provider = "file_encoding",
				hl = {
					fg = "red",
					bg = "bg_dim",
				},
				left_sep = "block",
				right_sep = "block",
			},
			format = {
				provider = "file_format",
				hl = {
					bg = "red",
					fg = "bg_dim",
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
