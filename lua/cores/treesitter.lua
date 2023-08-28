return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
		},
		cmd = { "TSUpdateSync" },
		opts = {
			highlight = {
				enable = true,
				sync_install = true,
				additional_vim_regex_highlighting = true,
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = false,
			},
			rainbow = {
				enable = true,
				hlgroups = {
					'Red',
					'Orange',
					'Yellow',
					'Green',
					'Blue',
					'Aqua',
					'Purple',
				},
			},
			context_commentstring = {
				enable = true,
			},
			textobjects = {
				move = {
					enable = false
				},
			}
		},
		config = function(_, opts)
			require("nvim-treesitter.install").compilers = { "clang" }
			require("nvim-treesitter.configs").setup(opts)
		end
	}
}
