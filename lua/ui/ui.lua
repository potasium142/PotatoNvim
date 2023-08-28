return {
	"nvim-tree/nvim-web-devicons",
	{
		"rcarriga/nvim-notify",
		opts = {
			stages  = "fade_in_slide_out",
			timeout = 1000,
			render  = "compact"
		},
	},
	{
		"onsails/lspkind.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		priority = 1000,
		config = function()
			require('lspkind').init({
				mode = "text",
				symbol_map = Symbol_map
			})
		end
	},
	{
		"winston0410/range-highlight.nvim",
		config = function()
			require("range-highlight").setup()
		end
	},
	{
		"folke/noice.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
		dependencies = {
			"stevearc/dressing.nvim",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"winston0410/range-highlight.nvim",
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
				lsp_doc_border = false,
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
		}
	}
}
