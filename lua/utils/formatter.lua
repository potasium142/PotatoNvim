return {
	'mhartington/formatter.nvim',
	opts = function()
		return {
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				c = {
					require("formatter.filetypes.cpp").clangformat,
				},
				cpp = {
					require("formatter.filetypes.cpp").clangformat,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				markdown = {
					require("formatter.filetypes.markdown").prettier,
				},
				html = {
					require("formatter.filetypes.markdown").prettier,
				},
				json = {
					require("formatter.filetypes.markdown").prettier,
				},
				latex = {
					require("formatter.filetypes.latex").latexindent,
				},
				javascript = {
					require("formatter.filetypes.markdown").prettier,
				},
				sass = {
					require("formatter.filetypes.markdown").prettier,
				},
				scss = {
					require("formatter.filetypes.markdown").prettier,
				},
				css = {
					require("formatter.filetypes.markdown").prettier,
				},
				python = {
					require("formatter.filetypes.python").autopep8,
				},
				toml = {
					require("formatter.filetypes.toml").taplo,
				},
				yaml = {
					require("formatter.filetypes.yaml").yamlfmt,
				},
				['*'] = { require("formatter.filetypes.any").remove_trailing_whitespace }
			}
		}
	end
}
