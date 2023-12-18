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
			formatters_by_ft = {
				lua = {
					"stylua",
				},
				c = {
					"clang_format",
				},
				cpp = {
					"clang_format",
				},
				rust = {
					"rustfmt",
				},
				markdown = {
					"prettier",
				},
				html = {
					"prettier",
				},
				json = {
					"prettier",
				},
				latex = {
					"latexindent",
				},
				javascript = {
					"prettier",
				},
				sass = {
					"prettier",
				},
				scss = {
					"prettier",
				},
				css = {
					"prettier",
				},
				python = {
					"autopep8",
				},
				toml = {
					"taplo",
				},
				yaml = {
					"yamlfmt",
				},
				bash = {
					"shfmt",
				},
				typst = {
					"typstfmt",
				},
				["_"] = { "trim_whitespace" },
			},

			format_after_save = {
				-- timeout_ms = 500,
				lsp_fallback = true,
			},
		}
	end,
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
