return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local winbar = {
			lualine_a = { "filename" },
			lualine_b = { "diff" },
			lualine_c = {
				{ "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
			},
			lualine_x = {},
			lualine_z = {
				{
					"lsp_status",
					icon = "",
				},
			},
			lualine_y = {
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
					tabline = 0,
					statusline = 0,
					winbar = 0,
					refresh_time = 700,
				},
				disabled_filetypes = {
					statusline = {},
					winbar = { "neo-tree", "dap-view" },
				},

				globalstatus = false,
			},
			-- inactive_sections = {
			-- 	lualine_a = { "windows" },
			-- 	lualine_b = { { "branch", icon = "" }, { "diff" } },
			-- },
			sections = winbar,
			inactive_sections = winbar,
			tabline = {},
		})
	end,
}
