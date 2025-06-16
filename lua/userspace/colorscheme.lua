return {
	"everviolet/nvim",
	name = "evergarden",
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	opts = {
		theme = {
			variant = "spring", -- 'winter'|'fall'|'spring'|'summer'
			accent = "green",
		},
	},
	config = function(_, opts)
		require("evergarden").setup(opts)
		vim.cmd.colorscheme("evergarden")
	end,
}
