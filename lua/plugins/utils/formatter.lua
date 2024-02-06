local formatters = require("loader.language").formatter
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

		conform.formatters.clang_format = {
			prepend_args = {
				"--style",
				"{IndentWidth: 4}",
			},
		}
	end,
}
