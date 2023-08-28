return {
	"akinsho/bufferline.nvim",
	lazy = false,
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
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
			separator_style = "thick"
		},
		highlights = {
			buffer_selected = {
				italic = false, -- gui = "bold, italic" by default
			},
			numbers_selected = { italic = false },
			diagnostic_selected = { italic = false },
			error_diagnostic_selected = { italic = false },
			error_selected = { italic = false },
			warning_diagnostic_selected = { italic = false },
			warning_selected = { italic = false },
			info_diagnostic_selected = { italic = false },
			info_selected = { italic = false },
		},
	},
	keys = {
		{ "<Space>p",  "<cmd>BufferLineTogglePin<CR>" },
		{ "<Space>st", "<cmd>BufferLineSortByTabs<CR>" },
		{ "<Space>j",  "<cmd>BufferLinePick<CR>" },
	},

}
