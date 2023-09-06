return {
	{
		"kwkarlwang/bufresize.nvim",
		lazy = true,
		opts = function()
			local opts = { noremap = true, silent = true }
			return {
				register = {
					keys = {
						{ "n", "<C-w>.", "<C-w><", opts },
						{ "n", "<C-w>,", "<C-w>>", opts },
						{ "n", "<C-w>+", "<C-w>+", opts },
						{ "n", "<C-w>-", "<C-w>-", opts },
						{ "n", "<C-w>_", "<C-w>_", opts },
						{ "n", "<C-w>=", "<C-w>=", opts },
						{ "n", "<C-w>|", "<C-w>|", opts },
						{ "", "<LeftRelease>", "<LeftRelease>", opts },
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
		end,
		config = function(_, opts)
			require("bufresize").setup(opts)
		end,
	},
}
