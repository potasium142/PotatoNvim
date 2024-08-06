local cfg = {}

cfg.lsp = {
	name = "pyright",
	config = {
		settings = {
			python = {
				analysis = {
					diagnosticSeverityOverrides = {
						reportUnusedExpression = "none",
					},
				},
			},
		},
	},
}

cfg.formatter = {
	name = { "autopep8" },
	ft = "python",
}

cfg.default_ft = "py"

return cfg
