return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"rcarriga/nvim-notify",
		enabled = true,
		config = function()
			require("notify").setup({
				render = "compact",
				stages = "static",
				timeout = 5000,
				top_down = true,
			})
		end,
	},
	{
		"winston0410/range-highlight.nvim",
		dependencies = { "winston0410/cmd-parser.nvim" },
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		lazy = false,
		opts = function()
			return {
				select = {
					backend = { "builtin", "nui", "telescope", "fzf_lua", "fzf" },
					builtin = {
						relative = "cursor",
					},
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
			local signs = require("config.icons").diagnostics
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		dependencies = {
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"winston0410/range-highlight.nvim",
			"nvim-treesitter/nvim-treesitter",
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
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			config = function(opts, _)
				require("noice").setup(opts)
			end,
		},
	},
}
