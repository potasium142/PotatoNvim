--Markdown
return {
	"iamcco/markdown-preview.nvim",
	lazy = false,
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
