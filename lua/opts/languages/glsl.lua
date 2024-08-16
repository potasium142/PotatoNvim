local cfg = {}

cfg.formatter = {
	name = { "clang_format" },
	ft = {
		"c",
		"cpp",
	},
}

cfg.default_ft = "c"

cfg.map_ft = {
	"fsh",
	"vsh",
	"frag",
	"vert",
	"glsl",
}
return cfg
