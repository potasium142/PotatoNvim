local cfg = {}

cfg.lsp = {
	-- name = "glsl_analyzer",
	-- external = true,
}
cfg.name = {
	"glsl",
}

cfg.ft = {
	"glsl",
	"vs",
	"fs",
	"gs",
	"vsh",
	"fsh",
	"gsh",
	"vshader",
	"fshader",
	"gshader",
	"vert",
	"frag",
	"geom",
	"tesc",
	"tese",
	"comp",
}

cfg.lint = {
	name = { "glslc" },
}

cfg.formatter = {
	name = {
		"clang_format",
	},
}

local gr_id = AutoGroup("GLSL", {
	clear = true,
})

local ft_ext = {}
for _, value in pairs(cfg.ft) do
	table.insert(ft_ext, "*." .. value)
end

AutoCMD("BufEnter", {
	pattern = ft_ext,
	group = gr_id,
	callback = function()
		vim.opt.filetype = "glsl"
	end,
})

return cfg
