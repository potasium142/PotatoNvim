local border = {
	{ "", "FloatBorder" },
	{ "", "FloatBorder" },
	{ "", "FloatBorder" },
	{ " ", "FloatBorder" },
	{ "", "FloatBorder" },
	{ "", "FloatBorder" },
	{ "", "FloatBorder" },
	{ " ", "FloatBorder" },
}

local opts = { noremap = true, silent = true }

local lsp_cfg = require("loader.lsp")

local default_setup = {
	capabilities = {
		textDocument = {
			completion = {
				dynamicRegistration = false,
				completionItem = {
					snippetSupport = true,
					commitCharactersSupport = true,
					deprecatedSupport = true,
					preselectSupport = true,
					tagSupport = {
						valueSet = {
							1, -- Deprecated
						},
					},
					insertReplaceSupport = true,
					resolveSupport = {
						properties = {
							"documentation",
							"detail",
							"additionalTextEdits",
							"sortText",
							"filterText",
							"insertText",
							"textEdit",
							"insertTextFormat",
							"insertTextMode",
						},
					},
					insertTextModeSupport = {
						valueSet = {
							1, -- asIs
							2, -- adjustIndentation
						},
					},
					labelDetailsSupport = true,
				},
				contextSupport = true,
				insertTextMode = 1,
				completionList = {
					itemDefaults = {
						"commitCharacters",
						"editRange",
						"insertTextFormat",
						"insertTextMode",
						"data",
					},
				},
			},
		},
	},
	textDocument = {
		hover = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		signatureHelp = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	},
}

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		lazy = true,
		opts = {
			ui = {
				icons = {
					package_installed = "+",
					package_pending = "!",
					package_uninstalled = "-",
				},
			},
		},
		-- config = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				virtual_lines = false,
				-- virtual_lines = { only_current_line = false },
				float = { border = border },
			})

			for name, config in pairs(lsp_cfg) do
				local setup = vim.tbl_deep_extend("force", default_setup, config)
				-- require("lspconfig")[name].setup(setup)
				vim.lsp.enable(name)
				vim.lsp.config(name, setup)
				-- print(vim.inspect(setup))
			end

			-- require("mason-lspconfig").setup({
			-- 	automatic_enable = true,
			-- })
			-- require("mason-lspconfig").setup_handlers(handlers)
		end,
		keys = function()
			local buf = vim.lsp.buf
			local diag = vim.diagnostic
			return {
				{
					"<leader>ca",
					buf.code_action,
					opts,
				},
				{
					"[d",
					diag.goto_prev,
					opts,
				},
				{
					"<leader>rn",
					buf.rename,
					opts,
				},
				{
					"K",
					buf.hover,
					opts,
				},
				{
					"<leader>cr",
					buf.references,
					opts,
				},
				{
					"]d",
					diag.goto_next,
					opts,
				},
			}
		end,
	},
	{
		"rmagatti/goto-preview",
		dependencies = { "rmagatti/logger.nvim" },
		event = { "LspAttach" },
		config = true,
		keys = function()
			local gt = require("goto-preview")
			return {
				{
					"<leader>vd",
					gt.goto_preview_definition,
				},
				{
					"<leader>vq",
					gt.close_all_win,
				},
				{
					"<leader>vi",
					gt.goto_preview_implementation,
				},
				{
					"<leader>vd",
					gt.goto_preview_declaration,
				},
			}
		end,
	},
}
