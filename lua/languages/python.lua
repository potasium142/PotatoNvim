local cfg = {}

cfg.ft = {
	"py",
}

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
	name = {
		"autopep8",
	},
}

return cfg
