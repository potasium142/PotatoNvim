local cfg = {}

cfg.lint = {
	name = { "vale" },
}

cfg.name = {
	"markdown",
}

cfg.ft = {
	"md",
}

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
--Markdown
return cfg
