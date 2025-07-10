--- @type LspConfig
return {
	name = "rust_analyzer",
	ft_pattern = { "*.rs" },
	config = {
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
