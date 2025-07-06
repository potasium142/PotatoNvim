local opts = { noremap = true, silent = true }

local lsp_cfg = require("loader.lsp")

local default_setup = require("userspace.lsp_capabilities")

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
			{
				"mason-org/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
				opts = {
					automatic_enable = true,
				},
			},
		},
		config = function()
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				virtual_lines = { current_line = true },
				float = { border = default_setup.border },
				severity_sort = true,
			})

			for name, config in pairs(lsp_cfg) do
				local setup = vim.tbl_deep_extend("force", default_setup.capabilities, config)
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
