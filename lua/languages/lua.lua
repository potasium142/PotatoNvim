local cfg = {}

cfg.lsp = {
	external = true,
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
}

cfg.formatter = {
	name = { "stylua" },
}

cfg.name = { "lua" }

cfg.ft = {
	"lua",
}

return cfg
