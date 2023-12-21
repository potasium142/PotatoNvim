local opts = { noremap = true, silent = true }

local local_lsp = require("config.lsp")

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
			local default_setup = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities["documentSymbolProvider"] then
						require("nvim-navic").attach(client, bufnr)
					end
				end,
			}

			require("mason-lspconfig").setup()

			for server, config in pairs(local_lsp) do
				for key, val in pairs(default_setup) do
					config[key] = val
				end
				require("lspconfig")[server].setup(config)
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					if local_lsp[server_name] == nil then
						require("lspconfig")[server_name].setup(default_setup)
					end
				end,
			})
		end,
		keys = {
			{
				"<Space>ca",
				function()
					vim.lsp.buf.code_action()
				end,
				opts,
			},
			{
				"[d",
				function()
					vim.diagnostic.goto_prev()
				end,
				opts,
			},
			{
				"<Space>rn",
				function()
					vim.lsp.buf.rename()
				end,
				opts,
			},
			{
				"K",
				function()
					vim.lsp.buf.hover()
				end,
				opts,
			},
			{
				"<Space>gd",
				function()
					vim.lsp.buf.definition()
				end,
				opts,
			},
			{
				"]d",
				function()
					vim.diagnostic.goto_next()
				end,
				opts,
			},
		},
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
		init = function()
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				virtual_lines = { only_current_line = true },
			})
		end,
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
