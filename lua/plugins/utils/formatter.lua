local formatters = require("loader.language").formatter
local fmt_args = require("loader.formatter_cfg")
return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = function()
		return {
			formatters_by_ft = formatters,
			format_after_save = {
				lsp_fallback = false,
			},
		}
	end,
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		for fmt, args in pairs(fmt_args) do
			conform.formatters[fmt] = args
		end
	end,
}
