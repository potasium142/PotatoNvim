return {
	{
		"stevearc/dressing.nvim",
		enabled = true,
		lazy = false,
		opts = function()
			return {
				select = {
					get_config = function(opts)
						if opts.kind == "codeaction" then
							return {
								backend = "builtin",
								nui = {
									relative = "cursor",
								},
							}
						end
					end,
					builtin = {
						relative = "cursor",
						border = "single",
					},
					nui = {
						border = { style = "single" },
					},
					telescope = {
						borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				},
				input = {
					border = "single",
				},
			}
		end,
	},
	{
		"folke/noice.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		init = function()
			local signs = require("const.icons_text").diag
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = {
				format = {
					cmdline = { icon = ">" },
					search_down = { icon = "\\/" },
					search_up = { icon = "/\\" },
					filter = { icon = "$" },
					lua = { icon = "L" },
					help = { icon = "?" },
				},
			},
			format = {
				level = {
					icons = {
						error = "X",
						warn = "W",
						info = "i",
					},
				},
			},
			popupmenu = {
				kind_icons = false,
			},
			inc_rename = {
				cmdline = {
					format = {
						IncRename = { icon = "R" },
					},
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "single",
					},
				},
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			config = true,
		},
		keys = {
			{
				"tss",
				"<cmd>Telescope noice<cr>",
			},
		},
	},
}
