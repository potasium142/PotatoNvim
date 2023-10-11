return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local icons = require("config.icons")
		return {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and icons.diagnostics.Error
							or (e == "warning" and icons.diagnostics.Warn or icons.diagnostics.Hint)

						s = s .. n .. sym
					end
					return s
				end,
				offsets = {
					{
						filetype = "NvimTree",
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
			},
		}
	end,
	keys = {
		{ "<Space>p", "<cmd>BufferLineTogglePin<CR>" },
		{ "<Space>j", "<cmd>BufferLinePick<CR>" },
	},
}
