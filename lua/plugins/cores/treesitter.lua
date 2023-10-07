return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/nvim-treesitter",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
		},
		cmd = { "TSUpdateSync" },
		opts = {
			highlight = {
				enable = true,
				sync_install = true,
				additional_vim_regex_highlighting = false,
				disable = { "scss" },
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = false,
			},
			context_commentstring = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "gcc" }
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
