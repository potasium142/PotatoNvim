return {
	{
		"kevinhwang91/nvim-fundo",
		lazy = false,
		build = function()
			require("fundo").install()
		end,
		init = function()
			Set.undofile = true
		end,
		config = function(_, opts)
			require("fundo").setup(opts)
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function(_, opts)
			require("telescope").load_extension("undo")
		end,
		keys = {
			{ "tsu", "<cmd>Telescope undo<cr>" },
		},
	},
}
