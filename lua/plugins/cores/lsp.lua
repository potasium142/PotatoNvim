return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		init = function()
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = false,
					virtual_text = false,
				})
		end,
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					capabilities.textDocument.foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					}
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
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
		"nvimdev/lspsaga.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			diagnostic = {
				border_follow = false,
			},
			outline = {
				auto_preview = false,
			},
			lightbulb = {
				enable = true,
				enable_in_insert = true,
				sign = false,
				sign_priority = 40,
				virtual_text = true,
			},
			symbol_in_winbar = {
				enable = true,
				hide_keyword = false,
			},
			ui = {
				code_action = "",
			},
		},
		keys = {
			{ "<space>ca", "<cmd>Lspsaga code_action<CR>" },
			{ "<space>gh", "<cmd>Lspsaga finder<CR>" },
			{ "<space>rn", "<cmd>Lspsaga rename<CR>" },
			{ "<space>gd", "<cmd>Lspsaga goto_definition<CR>" },
			{ "<space>fd", "<cmd>Lspsaga peek_definition<CR>" },
			{ "<space>tt", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
			{ "<F4>", "<cmd>Lspsaga outline<CR>" },
			{ "<space>D", "<cmd>Lspsaga hover_doc<CR>" },
		},
	},
}
