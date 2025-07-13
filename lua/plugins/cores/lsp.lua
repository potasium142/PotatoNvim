local opts = { noremap = true, silent = true }

local default_setup = require("userspace.lsp_capabilities")

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		lazy = false,
		opts = {
			ui = {
				icons = {
					package_installed = "+",
					package_pending = "!",
					package_uninstalled = "-",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.diagnostic.config({
				underline = false,
				virtual_text = false,
				virtual_lines = { current_line = true },
				float = { border = default_setup.border },
				severity_sort = true,
			})
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
}
