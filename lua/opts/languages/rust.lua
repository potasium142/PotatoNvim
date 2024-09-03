local cfg = {}

cfg.default_ft = "rs"

cfg.plugins = {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
}

cfg.formatter = {
	name = { "rustfmt" },
	ft = "rust",
}

return cfg
