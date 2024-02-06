local linters = require("loader.language").lint
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local linter_sources = {}
		for _, value in pairs(linters) do
			table.insert(linter_sources, null_ls.builtins.diagnostics[value])
		end

		null_ls.setup({
			sources = linter_sources,
		})
	end,
}
