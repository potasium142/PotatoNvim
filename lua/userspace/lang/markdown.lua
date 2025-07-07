--- @type LangConfig
return {
	ft = "markdown",
	plugin = {
		{
			"MeanderingProgrammer/render-markdown.nvim",
			lazy = true,
			ft = {
				"md",
				"markdown",
			},
			opts = {
				file_types = { "markdown", "vimwiki" },
				completions = {
					lsp = { enabled = true },
					blink = { enabled = true },
				},
			},
			config = function(_, opts)
				require("render-markdown").setup(opts)

				vim.treesitter.language.register("markdown", "vimwiki")
			end,
		},
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
	},
	formatter = { "cbfmt", "prettier" },
	map_ft = { "md" },
}
