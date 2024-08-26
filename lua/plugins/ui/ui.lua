return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"rcarriga/nvim-notify",
		enabled = true,
		opts = function()
			return {
				render = "wrapped-compact",
				stages = "slide",
				timeout = 1000,
				top_down = true,
				fps = 5,
				on_open = function(win)
					if vim.api.nvim_win_is_valid(win) then
						vim.api.nvim_win_set_config(
							win,
							{ border = { "┌", "─", "┐", "│", "┙", "━", "┕", "│" } }
						)
					end
				end,
			}
		end,
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
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
						borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
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
		version = "4.4.7",
		priority = 1000,
		init = function()
			local signs = require("const.icons").diagnostics
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		dependencies = {
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
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
				lsp_doc_border = true,
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
	},
}
