return {
	"SmiteshP/nvim-navic",
	enabled = false,
	lazy = true,
	dependencies = {
		"neovim/nvim-lspconfig",
		"freddiehaddad/feline.nvim",
	},
	event = { "LspAttach" },
	opts = function()
		return {
			icons = require("const.icons_text").kinds,
			highlight = true,
		}
	end,
	config = function(_, opts)
		local navic = require("nvim-navic")

		navic.setup(opts)

		local lsp = {
			provider = {
				provider = "lsp_client_names",
				icon = "",
				hl = "GlobalBase13I",
				left_sep = {
					str = " ",
					hl = "GlobalBase13I",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase13I",
				},
			},
			errors = {
				provider = "diagnostic_errors",
				icon = "",
				hl = "GlobalBase9",
				left_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase9",
				},
			},
			warns = {
				provider = "diagnostic_warnings",
				icon = "",
				hl = "GlobalBase11",
				left_sep = {
					str = " ",
					hl = "GlobalBase11",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase11",
				},
			},
			hints = {
				provider = "diagnostic_hints",
				icon = "",
				hl = "GlobalBase14",
				left_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase14",
				},
			},
			info = {
				provider = "diagnostic_info",
				icon = "",
				hl = "GlobalBase10",
				left_sep = {
					str = " ",
					hl = "GlobalBase10",
				},
				right_sep = {
					str = " ",
					hl = "GlobalBase10",
				},
			},
		}

		local navic_winbar = {
			provider = function()
				return "||" .. navic.get_location()
			end,
			enabled = function()
				return navic.is_available()
			end,
			hl = "GlobalBase16",
			left_sep = {
				str = " ",
				hl = "GlobalBase0",
			},
			right_sep = {
				str = " ",
				hl = "GlobalBase0",
			},
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
