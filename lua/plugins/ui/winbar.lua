return {
	"SmiteshP/nvim-navic",
	enabled = true,
	lazy = true,
	dependencies = {
		"neovim/nvim-lspconfig",
		"freddiehaddad/feline.nvim",
	},
	event = { "LspAttach" },
	opts = function()
		return {
			icons = require("const.icons").kinds,
			highlight = true,
		}
	end,
	config = function(_, opts)
		local navic = require("nvim-navic")
		local icons = require("const.icons")
		navic.setup(opts)

		local lsp = {
			provider = {
				provider = "lsp_client_names",
				icon = " ",
				hl = {
					fg = "bg",
					bg = "purple",
				},
				left_sep = "block",
				right_sep = "block",
			},
			errors = {
				provider = "diagnostic_errors",
				icon = icons.diagnostics.Error,
				hl = {
					fg = "red",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
			warns = {
				provider = "diagnostic_warnings",
				icon = icons.diagnostics.Warn,
				hl = {
					fg = "yellow",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
			hints = {
				provider = "diagnostic_hints",
				icon = icons.diagnostics.Hint,
				hl = {
					fg = "blue",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
			info = {
				provider = "diagnostic_info",
				icon = icons.diagnostics.Info,
				hl = {
					fg = "green",
					bg = "bg",
				},
				left_sep = "block",
				right_sep = "block",
			},
		}

		local navic_winbar = {
			provider = function()
				return "  " .. navic.get_location()
			end,
			enabled = function()
				return navic.is_available()
			end,
			left_sep = "block",
			right_sep = "block",
		}

		local winbar_components = {
			{
				condition = function()
					return vim.bo.buftype ~= "nofile"
				end,
				active = {
					{ navic_winbar },
					{},
					{ lsp.errors, lsp.warns, lsp.hints, lsp.info, lsp.provider },
				},
				inactive = {},
			},
		}

		require("feline").winbar.setup({
			conditional_components = winbar_components,
			force_inactive = {
				buftypes = {
					"nofile",
					"terminal",
					"prompt",
				},
			},
		})
	end,
}
