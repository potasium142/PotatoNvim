local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

local opts = { noremap = true, silent = true }

local lsp_cfg = require("loader.language")

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
	on_attach = function(client, bufnr)
		if client.server_capabilities["documentSymbolProvider"] then
			require("nvim-navic").attach(client, bufnr)
		end
	end,
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
		config = true,
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

			for k, v in pairs(lsp_cfg.lsp_external) do
				local cfg = lsp_cfg.lsp_config[k]
				local merge_cfg = vim.tbl_deep_extend("force", default_setup, cfg or {})
				if v then
					require("lspconfig")[k].setup(merge_cfg)
				else
					handlers.k = merge_cfg
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
					function()
						buf.code_action()
					end,
					opts,
				},
				{
					"[d",
					function()
						diag.goto_prev()
					end,
					opts,
				},
				{
					"<Space>rn",
					function()
						buf.rename()
					end,
					opts,
				},
				{
					"K",
					function()
						buf.hover()
					end,
					opts,
				},
				{
					"<Space>gd",
					function()
						buf.definition()
					end,
					opts,
				},
				{
					"]d",
					function()
						diag.goto_next()
					end,
					opts,
				},
			}
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		event = { "LspAttach" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		enabled = true,
		lazy = true,
		event = { "LspAttach" },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"neovim/nvim-lspconfig",
		},
		event = { "LspAttach" },
		lazy = true,
		opts = {
			padding = true,
		},
		keys = {
			{
				"<Space>tt",
				function()
					require("trouble").toggle()
				end,
			},
		},
	},
}
