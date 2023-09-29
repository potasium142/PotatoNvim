return {
	"famiu/bufdelete.nvim",
	lazy = true,
	event = {
		"BufDelete",
	},
	keys = {
		{
			"<space>dd",
			function()
				require("bufdelete").bufdelete(0, true)
			end,
		},
	},
}
