return {
	external = true,
	name = "rust_analyzer",
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