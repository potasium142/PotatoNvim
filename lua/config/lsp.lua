local M = {}

M.lua_ls = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

M.rust_analyzer = {}

M.clangd = {}

M.glsl_analyzer = {}

return M
