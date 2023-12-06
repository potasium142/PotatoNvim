return {
	"akinsho/bufferline.nvim",
	enabled = false,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"neovim/nvim-lspconfig",
	},
	opts = function()
		local icons = require("config.icons")
		return {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return level:match("error") and icons.diagnostics.Error
						or (level:match("warning") and icons.diagnostics.Warn or icons.diagnostics.Hint)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
						seperator = true,
					},
					{
						filetype = "Outline",
						text = "Outline",
						highlight = "Outline",
					},
				},
				show_close_icons = false,
				show_buffer_close_icons = false,
				separator_style = { " " },
			},
		}
	end,
	keys = {
		{ "<Space>p", "<cmd>BufferLineTogglePin<CR>" },
		{ "<Space>j", "<cmd>BufferLinePick<CR>" },
	},
}
