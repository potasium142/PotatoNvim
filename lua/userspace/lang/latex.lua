vim.api.nvim_create_autocmd({ "BufReadPre", "BufEnter" }, {
	pattern = { "*.tex" },
	command = "setfiletype tex",
})

--- @type LangConfig
return {
	ft = "tex",
	formatter = {
		"tex-fmt",
	},
}
