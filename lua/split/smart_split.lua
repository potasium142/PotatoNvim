return {
	'mrjones2014/smart-splits.nvim',
	lazy = false,
	opts = {
		ignored_filetypes = {
			'nofile',
			'quickfix',
			'prompt',
			'dashboard',
			'neo-tree',
			'alpha'
		},
		resize_mode = {
			hooks = {
				on_leave = require('bufresize').register,
			},
		},
	},
}
