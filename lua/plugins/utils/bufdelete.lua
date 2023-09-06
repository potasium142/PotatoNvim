return {
	"famiu/bufdelete.nvim",
	lazy = true,
	keys = {
		{
			"<space>dd",
			function()
				require("bufdelete").bufdelete(0, true)
			end,
		},
	},
}
