local cfg = {}

cfg.formatter = {
	name = { "prettier" },
}

cfg.plugins = {
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
}

cfg.default_ft = "md"
--Markdown
return cfg
