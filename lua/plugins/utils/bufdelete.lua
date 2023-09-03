return {
	"famiu/bufdelete.nvim",
	keys = {
		{
			"<space>dd",
			function()
				require("bufdelete").bufdelete(0, true)
			end,
		},
	},
}
