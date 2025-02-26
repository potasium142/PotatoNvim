return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			extensions = {
				"lazy",
				"man",
				"mason",
			},
			options = {
				component_separators = " ",
				section_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename", "branch" },
				lualine_c = {},
				lualine_x = {
					{ "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
					{
						-- Lsp server name .
						function()
							local msg = ""
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,
						color = { fg = "cterm01" },
					},
				},
				lualine_y = { "encoding" },
				lualine_z = {
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
		})
	end,
}
