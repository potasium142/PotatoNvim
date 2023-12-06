return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = false,
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		-- enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"windwp/nvim-ts-autotag",
			-- "nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		opts = {
			highlight = {
				-- enable = true,
				sync_install = true,
				-- additional_vim_regex_highlighting = false,
				disable = { "scss" },
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "gcc" }
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
