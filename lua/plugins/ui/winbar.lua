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
			icons = require("config.icons").kind_icons,
			highlight = true,
		}
	end,
	config = function(_, opts)
		local navic = require("nvim-navic")
		local icons = require("config.icons")
		navic.setup(opts)

		local seperator = {
			blank = { provider = " " },
			cleft = { provider = "[" },
			cright = { provider = "]" }
		}
		local lsp = {
			provider = {
				provider = "lsp_client_names",
				icon = " ",
				hl = {
					fg = "cyan",
				},
				right_sep = " ",
				left_sep = " ",
			},
			errors = {
				provider = "diagnostic_errors",
				icon = icons.diagnostics.Error .. " ",
				hl = {
					fg = "red",
				},
				left_sep = " ",
			},
			warns = {
				provider = "diagnostic_warnings",
				icon = icons.diagnostics.Warn,
				hl = {
					fg = "yellow",
				},
				left_sep = " ",
			},
			hints = {
				provider = "diagnostic_hints",
				icon = icons.diagnostics.Hint,
				hl = {
					fg = "cyan",
				},
				left_sep = " ",
			},
			info = {
				provider = "diagnostic_info",
				icon = icons.diagnostics.Info,
				hl = {
					fg = "green",
				},
				left_sep = " ",
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
					{
						seperator.cleft,
						lsp.errors,
						lsp.warns,
						lsp.hints,
						lsp.info,
						lsp.provider,
						seperator.cright },
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
