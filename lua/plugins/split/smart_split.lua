return {
	"mrjones2014/smart-splits.nvim",
	lazy = true,
	dependencies = { "kwkarlwang/bufresize.nvim" },
	opts = {
		ignored_filetypes = {
			"nofile",
			"quickfix",
			"prompt",
			"dashboard",
			"neo-tree",
			"alpha",
		},
		resize_mode = {
			hooks = {
				on_leave = require("bufresize").register,
			},
		},
	},
	keys = {
		{
			"sr",
			function()
				require("smart-splits").start_resize_mode()
			end,
		},
	},
}
