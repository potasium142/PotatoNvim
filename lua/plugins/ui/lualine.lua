return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local winbar = {
			lualine_x = {
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
				"encoding",
			},
			lualine_y = { "location", "progress" },
			lualine_z = { "filename" },
		}
		require("lualine").setup({
			extensions = {
				"lazy",
				"man",
				"mason",
			},
			options = {
				component_separators = " ",
				section_separators = { left = " ", right = " " },
				refresh = { -- sets how often lualine should refresh it's contents (in ms)
					statusline = 1000,
					winbar = 1000,
				},
				disabled_filetypes = {
					statusline = {},
					winbar = { "neo-tree" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = { { "diff" } },
				lualine_x = {},
				lualine_y = {
					{ "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
				},
				lualine_z = {
					{
						"lsp_status",
						icon = "",
					},
				},
			},
			inactive_sections = {
				lualine_a = { "windows" },
				lualine_b = { { "branch", icon = "" }, { "diff" } },
			},
			winbar = winbar,
			inactive_winbar = winbar,
			tabline = {},
		})
	end,
}
