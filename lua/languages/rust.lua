local cfg = {}

cfg.name = {
	"rust"
}

cfg.ft = {
	"rs"
}

cfg.plugins = {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
}

cfg.formatter = {
	name = { "rustfmt" },
}

cfg.lsp = {
	external = true,
	name = "rust_analyzer",
}

return cfg

