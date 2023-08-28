Map('n', 'sr', function()
	require('smart-splits').start_resize_mode()
end)
return {
	{
		"numToStr/Navigator.nvim",
		lazy = false,
		config = true,
		keys = {
			{ '<A-h>', '<CMD>NavigatorLeft<CR>',     mode = { "n", "t" } },
			{ '<A-l>', '<CMD>NavigatorRight<CR>',    mode = { "n", "t" } },
			{ '<A-k>', '<CMD>NavigatorUp<CR>',       mode = { "n", "t" } },
			{ '<A-j>', '<CMD>NavigatorDown<CR>',     mode = { "n", "t" } },
			{ '<A-p>', '<CMD>NavigatorPrevious<CR>', mode = { "n", "t" } },
		}

	},
	{
		"kwkarlwang/bufresize.nvim",
		lazy = false,
		opts = function()
			local opts = { noremap = true, silent = true }
			return {
				register = {
					keys = {
						{ "n", "<C-w>.",        "<C-w><",             opts },
						{ "n", "<C-w>,",        "<C-w>>",             opts },
						{ "n", "<C-w>+",        "<C-w>+",             opts },
						{ "n", "<C-w>-",        "<C-w>-",             opts },
						{ "n", "<C-w>_",        "<C-w>_",             opts },
						{ "n", "<C-w>=",        "<C-w>=",             opts },
						{ "n", "<C-w>|",        "<C-w>|",             opts },
						{ "",  "<LeftRelease>", "<LeftRelease>",      opts },
						{ "i", "<LeftRelease>", "<LeftRelease><C-o>", opts },
					},
					trigger_events = { "BufWinEnter", "WinEnter" },
				},
				resize = {
					keys = {},
					trigger_events = { "VimResized" },
					increment = false,
				},
			}
		end
		,
		config = function(_, opts)
			require("bufresize").setup(opts)
		end
	},

}
