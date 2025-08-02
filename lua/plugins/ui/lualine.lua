return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	config = function()
		local winbar = {
			lualine_c = {
				{ "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
			},
			lualine_a = {
				{
					"lsp_status",
					icon = "",
				},
			},
			lualine_b = { { "diff" } },
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
					tabline = 0,
					statusline = 0,
					winbar = 0,
					refresh_time = 700,
				},
				disabled_filetypes = {
					statusline = {},
					winbar = { "neo-tree", "dap-view" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = { "windows" },
				lualine_b = { { "branch", icon = "" }, { "diff" } },
			},
			winbar = winbar,
			inactive_winbar = winbar,
			tabline = {},
		})
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			callback = function()
				require("lualine").refresh({
					place = { "winbar" },
				})
			end,
		})
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "GitSignsUpdate",
			callback = function()
				require("lualine").refresh({
					place = { "statusline" },
				})
				-- print("update")
			end,
		})
	end,
}
