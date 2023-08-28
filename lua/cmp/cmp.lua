return {
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
		},
	},
}
