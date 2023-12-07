local opts = { noremap = true, silent = true }

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
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							if client.server_capabilities["documentSymbolProvider"] then
								require("nvim-navic").attach(client, bufnr)
							end
						end,
					})
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
	{
		"kosayoda/nvim-lightbulb",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = { "LspAttach" },
		lazy = true,
		opts = function()
			return {
				autocmd = {
					enabled = true,
					updatetime = 0,
					events = { "InsertLeave", "CursorHold" },
					pattern = { "*" },
				},
				virtual_text = {
					enabled = true,
					text = require("config.icons").diagnostics.Hint,
					hl = "yellow",
				},
			}
		end,
	},
}
