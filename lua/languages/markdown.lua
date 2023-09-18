--Markdown
return {
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
		G.mkdp_theme = "light"
	end,
}
