return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. count .. " " .. icon
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
					filetype = "lspsagaoutline",
					text = "Outline",
					highlight = "Outline",
				},
			},
			separator_style = "thick",
			show_close_icons = false,
			show_buffer_close_icons = false,
		},
	},
	keys = {
		{ "<Space>p", "<cmd>BufferLineTogglePin<CR>" },
		{ "<Space>j", "<cmd>BufferLinePick<CR>" },
	},
}
