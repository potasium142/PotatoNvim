local formatters = require("builder.builder").formatter
local formatters_args = require("builder.builder").formatter_args
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
				lsp_fallback = true,
			},
		}
	end,
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		for key, value in pairs(formatters) do
			conform.formatters[key] = {
				args = value,
			}
		end
	end,
}
