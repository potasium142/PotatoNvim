local cfg = {}

cfg.name = {
	"c",
	"cpp",
}

cfg.ft = {
	"c",
	"cpp",
	"h",
	"hpp",
	"cc",
}

cfg.lsp = {
	external = true,
	name = "clangd",
}

cfg.formatter = {
	name = { "clang_format" },
}

return cfg
