return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
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
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "clang", vim.fn.getenv("CC"), "cc", "gcc", "cl", "zig" }
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
