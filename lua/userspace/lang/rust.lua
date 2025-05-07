--- @type LangConfig
return {
	ft = "rust",
	formatter = { "rustfmt" },
	plugin = {
		{
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			dependencies = { "nvim-lua/plenary.nvim" },
			config = true,
		},
	},
}
