return {
	"booperlv/nvim-gomove",
	lazy = true,
	config = function()
		require("gomove").setup({
			map_defaults = false,
			reindent = true,
			undojoin = true,
			move_past_end_col = false,
		})
	end,
	keys = {
		{ "<S-j>", "<Plug>GoNSMDown" },
		{ "<S-k>", "<Plug>GoNSMUp" },
	},
}
