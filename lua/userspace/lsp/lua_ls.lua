--- @type LspConfig
return {
	name = "lua_ls",
	config = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	ft_pattern = { "*.lua" },
}
