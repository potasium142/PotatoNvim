--Markdown
return {
	"iamcco/markdown-preview.nvim",
	lazy = false,
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		G.mkdp_theme = "light"
	end,
}
