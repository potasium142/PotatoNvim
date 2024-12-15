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

local capabilities = {
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
}

local default_setup = {
	capabilities = capabilities,
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
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				virtual_lines = { only_current_line = true },
				float = { border = border },
			})

			require("mason-lspconfig").setup()

			local handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup(default_setup)
				end,
			}

			for name, config in pairs(lsp_cfg.external) do
				local setup = vim.tbl_deep_extend("force", default_setup, config)
				require("lspconfig")[name].setup(setup)
			end

			for name, config in pairs(lsp_cfg.automatic) do
				if type(config) == "table" then
					local setup = vim.tbl_deep_extend("force", default_setup, config)
					handlers[name] = function()
						require("lspconfig")[name].setup(setup)
					end
				else
					handlers[name] = config
				end
			end

			require("mason-lspconfig").setup_handlers(handlers)
		end,
		keys = function()
			local buf = vim.lsp.buf
			local diag = vim.diagnostic
			return {
				{
					"<Space>ca",
					buf.code_action,
					opts,
				},
				{
					"[d",
					diag.goto_prev,
					opts,
				},
				{
					"<Space>rn",
					buf.rename,
					opts,
				},
				{
					"K",
					buf.hover,
					opts,
				},
				{
					"<Space>gr",
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
		"antosha417/nvim-lsp-file-operations",
		enabled = false,
		event = { "LspAttach" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		name = "lsp-file-operations",
		config = true,
	},
}
