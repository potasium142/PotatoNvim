return {
	"kevinhwang91/nvim-fundo",
	enabled = true,
	build = function()
		require("fundo").install()
	end,
	init = function()
		Set.undofile = true
	end,
	config = function(_, opts)
		require("fundo").setup(opts)
	end,
}
