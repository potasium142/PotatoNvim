local cfg = {}

cfg.lsp = {
	name = "glslls",
	external = true,
}
cfg.name = {
	"glsl",
	"hlsl",
}

cfg.ft = {
	"vert",
	"frag",
	"glsl",
	"fsh",
	"vsh",
	"hlsl",
}

cfg.lint = {
	name = { "glslc" },
}

cfg.formatter = {
	name = {
		"clang-format",
	},
}

cfg.plugins = {
	{
		"tikhomirov/vim-glsl",
	},
}

for _, value in pairs(cfg.ft) do
	vim.treesitter.language.register("glsl", value)
end

return cfg
