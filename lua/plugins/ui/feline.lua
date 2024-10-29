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

		local mode_hl = {
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

		local neovim_icon = function()
			local vim_mode_hl = function()
				local hl = require("feline.providers.vi_mode").get_vim_mode()
				return mode_hl_i[hl]
			end
			return {
				provider = "   ",
				hl = vim_mode_hl,
			}
		end

		local mode_name = function()
			local vim_mode_hl = function()
				local hl = require("feline.providers.vi_mode").get_vim_mode()
				return mode_hl[hl]
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

		local git_provider = require("feline.providers.git")
		local git = {
			branch = {
				provider = function()
					return icons.git.Branch .. " " .. git_provider.git_branch()
				end,
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
				provider = "git_diff_added",
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
				provider = "git_diff_changed",
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
				provider = "git_diff_removed",
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
					format = "  {line}:{col} ",
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
			neovim_icon(),
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
