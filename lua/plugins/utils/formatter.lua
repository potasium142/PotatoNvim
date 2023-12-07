return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
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
				["*"] = { "trim_whitespace" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			format_after_save = {
				lsp_fallback = "always",
			},
		}
	end,
	config = function(_, opts)
		require("conform").setup(opts)

		AutoCMD("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
