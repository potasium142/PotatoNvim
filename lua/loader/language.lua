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

	-- LSP builder
	if cfg.lsp.name then
		M.lsp_external[cfg.lsp.name] = cfg.lsp.external
		M.lsp[cfg.lsp.name] = cfg.lsp.config
	end

	-- plugins
	for _, plug in pairs(cfg.plugins) do
		table.insert(M.plugins, plug)
	end

	-- formatter
	local formatter_ft = cfg.formatter.ft or cfg.default_ft

	if type(formatter_ft) == "string" then
		formatter_ft = { formatter_ft }
	end

	for _, fmt in pairs(formatter_ft) do
		M.formatter[fmt] = vim.tbl_extend("keep", M.formatter[fmt] or {}, cfg.formatter.name)
	end

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
