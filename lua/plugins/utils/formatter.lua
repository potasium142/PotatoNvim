local formatters = require("loader.language").formatter
local fmt_args = require("userspace.loader.formatter")
return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	cmd = { "ConformInfo" },
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

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})

		for fmt, args in pairs(fmt_args) do
			conform.formatters[fmt] = args
		end
	end,
}
