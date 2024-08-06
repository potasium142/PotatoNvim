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

cfg.lsp = {
	external = true,
	name = "rust_analyzer",
	config = {
		on_attach = function(client, bufnr)
			if client.server_capabilities["documentSymbolProvider"] then
				require("nvim-navic").attach(client, bufnr)
			end
			client.server_capabilities.semanticTokensProvider = nil
		end,
		capabilities = {
			semanticTokensProvider = nil,
			textDocument = {
				semanticTokens = nil,
			},

			workspace = {
				semanticTokens = nil,
			},
		},
	},
}

return cfg
