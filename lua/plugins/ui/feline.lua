return {
	"freddiehaddad/feline.nvim",
	opts = {},
	enabled = true,
	config = function()
		local feline = require("feline")

		local seperator = {
			provider = " ",
			hl = "bg",
		}

		local mode_hl_i = {
			NORMAL = "GlobalBase2I",
			OP = "GlobalBase2I",
			COMMAND = "GlobalBase2I",
			SHELL = "GlobalBase2I",
			TERM = "GlobalBase2I",
			NONE = "GlobalBase12I",
			INSERT = "GlobalBase1I",
			VISUAL = "GlobalBase3I",
			BLOCK = "GlobalBase3I",
			LINES = "GlobalBase3I",
		}

		local _mode_hl = {
			NORMAL = "GlobalBase2",
			OP = "GlobalBase2",
			COMMAND = "GlobalBase2",
			SHELL = "GlobalBase2",
			TERM = "GlobalBase2",
			NONE = "GlobalBase12",
			INSERT = "GlobalBase1",
			VISUAL = "GlobalBase3",
			BLOCK = "GlobalBase3",
			LINES = "GlobalBase3",
		}

		local mode_name = function()
			local vim_mode_hl = function()
				local hl = require("feline.providers.vi_mode").get_vim_mode()
				return mode_hl_i[hl]
			end

			return {
				provider = {
					name = "vi_mode",
					opts = {
						show_mode_name = true,
					},
				},
				hl = vim_mode_hl,
				icon = "",
				left_sep = {
					str = " ",
					hl = vim_mode_hl,
				},
				right_sep = {
					str = " ",
					hl = vim_mode_hl,
				},
			}
		end
		local git_provider = function(type, sign)
			local gsd = vim.b.gitsigns_status_dict
			if gsd and gsd[type] > 0 then
				return sign .. vim.b.gitsigns_status_dict[type]
			end
			return ""
		end

		local git = {
			branch = {
				provider = "git_branch",
				icon = "",
				hl = "GlobalBase3I",
				left_sep = {
					str = " ",
					hl = "GlobalBase3I",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase3I",
				},
			},
			add = {
				provider = function()
					return git_provider("added", "+")
				end,
				icon = "",
				hl = "GlobalBase10",
				left_sep = {
					str = " ",
					hl = "GlobalBase10",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase10",
				},
			},
			change = {
				provider = function()
					return git_provider("changed", "~")
				end,
				icon = "",
				hl = "GlobalBase14",

				left_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
			},
			remove = {
				provider = function()
					return git_provider("removed", "-")
				end,
				icon = "",
				hl = "GlobalBase9",
				left_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
			},
		}

		local position = {
			provider = {
				name = "position",
				opts = {
					format = " {line}:{col} ",
				},
			},
			hl = "GlobalBase14",
		}
		local line_percentage = {
			provider = "line_percentage",
			hl = "GlobalBase14I",

			left_sep = {
				str = " ",
				hl = "GlobalBase14I",
			},
			right_sep = {
				str = " ",
				hl = "GlobalBase14I",
			},
		}

		local file = {
			type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = false,
						colored_icon = false,
					},
				},
				hl = "GlobalBase14I",
				left_sep = {
					str = " ",
					hl = "GlobalBase14I",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase14I",
				},
			},
			name = {
				provider = function()
					return vim.fn.expand("%:t:r")
				end,
				hl = "GlobalBase14",
				left_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
			},
			encoding = {
				provider = "file_encoding",
				hl = "GlobalBase9",
				left_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
			},
			format = {
				provider = "file_format",
				hl = "GlobalBase9I",
				left_sep = {
					str = " ",
					hl = "GlobalBase9I",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase9I",
				},
			},
		}

		local left = {
			seperator,
			mode_name(),
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
