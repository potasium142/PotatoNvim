return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		-- enabled = false,
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
			highlight = {
				enable = true,
				sync_install = true,
				-- disable = { "scss" },
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "clang" }
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
