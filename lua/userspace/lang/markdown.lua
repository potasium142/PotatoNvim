--- @type LangConfig
return {
	ft = "markdown",
	plugin = {
		{
			"iamcco/markdown-preview.nvim",
			lazy = true,
			ft = {
				"md",
				"markdown",
			},
			cmd = {
				"MarkdownPreview",
			},
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
			config = function()
				vim.g.mkdp_theme = "light"
			end,
		},
		{
			"OXY2DEV/markview.nvim",
			lazy = true,
			ft = {
				"md",
				"markdown",
			},
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
	},
	formatter = { "cbfmt", "prettier" },
	map_ft = { "md" },
}
