return {
	"booperlv/nvim-gomove",
	lazy = false,
	config = function()
		require("gomove").setup {
			map_defaults = false,
			reindent = true,
			undojoin = true,
			move_past_end_col = false,
		}
	end,
	keys = {
		{ "<S-j>", "<Plug>GoNSMDown" },
		{ "<S-k>", "<Plug>GoNSMUp" },
		{ "<S-j>", "<Plug>GoVSMDown", mode = "v" },
		{ "<S-k>", "<Plug>GoVSMUp",   mode = "v" },
	}
}
