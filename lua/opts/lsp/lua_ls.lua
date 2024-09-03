local M = {}

M.name = "lua_ls"

M.executable = "vim-language-server"

M.external = false

M.config = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

return M
