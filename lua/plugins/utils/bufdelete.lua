return {
	"famiu/bufdelete.nvim",
	lazy = true,
	enabled = false,
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
