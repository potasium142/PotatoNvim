return {
	"freddiehaddad/feline.nvim",
	opts = {},
	enabled = true,
	dependencies = {
		"neanias/everforest-nvim",
		"neovim/nvim-lspconfig",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local icons = require("config.icons")
		local feline = require("feline")
		local palette = require("everforest.colours").generate_palette(require("everforest").config, vim.o.background)

		local colors = {
			fg = palette.fg,
			bg = palette.bg0,
			black = palette.bg_dim,
			red = palette.red,
			orange = palette.orange,
			yellow = palette.yellow,
			green = palette.green,
			blue = palette.blue,
			aqua = palette.aqua,
			purple = palette.purple,
			white = palette.fg,
			bg_red = palette.bg_red,
			bg_visual = palette.bg_visual,
			bg_yellow = palette.bg_yellow,
			bg_blue = palette.bg_blue,
			bg_green = palette.bg_green,
		}

		local modes = setmetatable({
			["n"] = " N ",
			["no"] = " N ",
			["v"] = " V ",
			["s"] = " S ",
			["i"] = " I ",
			["ic"] = " I ",
			["R"] = " R ",
			["c"] = " C ",
			["ce"] = " X ",
			["r"] = " P ",
			["rm"] = " M ",
			["r?"] = " C ",
			["t"] = " T ",
			["S"] = "S L",
			["V"] = "V L",
			[""] = "V B",
			[""] = "S B",
			["Rv"] = "V R",
			["cv"] = "E X",
			["!"] = "S H",
		}, {
			__index = function()
				return "-"
			end,
		})

		local seperator = {
			provider = " ",
		}

		local vim_mode = {
			provider = function()
				return " " .. modes[vim.api.nvim_get_mode().mode]
			end,
			hl = function()
				return {
					fg = "bg",
					bg = require("feline.providers.vi_mode").get_mode_color(),
					style = "bold",
					name = "NeovimModeHLColor",
				}
			end,
			left_sep = "block",
			right_sep = "block",
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
					format = "  {line} ",
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
		local scrollbar = {
			provider = {
				name = "scroll_bar",
				opts = {
					reverse = true,
				},
			},
			hl = {
				fg = "bg",
				bg = "yellow",
			},
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
				},
				left_sep = "block",
				right_sep = "block",
			},
			name = {
				provider = function()
					local filename = vim.fn.expand("%:t:r")
					return filename == 0 and "Unnamed" or filename
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
			vim_mode,
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
			scrollbar,
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
