local M = {
	lsp = {},
	plugins = {},
	lsp_external = {},
	formatter = {},
}

local path = vim.fn.stdpath("config") .. "/lua/opts/languages"

local lang_list = vim.fn.readdir(path)

local default_cfg = {
	formatter = {
		name = {},
		ft = false,
	},
	lsp = {
		external = false,
		name = false,
		config = false,
	},
	plugins = {},
	ft = false,
	default_ft = false,
	map_ft = false,
}

for _, l in pairs(lang_list) do
	local lang = l:gsub("%.lua$", "")
	local lua = require("opts.languages." .. lang)
	local cfg = vim.tbl_deep_extend("force", default_cfg, lua)

	-- plugins
	for _, plug in pairs(cfg.plugins) do
		table.insert(M.plugins, plug)
	end

	-- formatter

	if cfg.map_ft then
		local mapped = {}
		for _, map_ft in ipairs(cfg.map_ft) do
			mapped[map_ft] = cfg.default_ft
		end
		vim.filetype.add({
			extension = mapped,
		})
	end
end

return M
