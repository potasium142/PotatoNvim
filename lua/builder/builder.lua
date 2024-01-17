local M = {
	lsp_config = {},
	lsp_external = {},
	plugins = {},
	formatter = {},
	formatter_args = {},
	lint = {},
}

local path = vim.fn.stdpath("config") .. "/lua/languages"

---@type table
local lang_list = vim.fn.readdir(path)

local default_cfg = {
	formatter = {
		name = {},
		args = false,
		ft = false,
	},
	lsp = {
		external = false,
		name = false,
		config = false,
	},
	lint = {
		name = {},
		custom = false,
	},
	plugins = {},
	ft = false,
	name = {},
}

for _, l in pairs(lang_list) do
	local lang = l:gsub("%.lua$", "")
	local lua = require("languages." .. lang)
	local cfg = vim.tbl_deep_extend("force", default_cfg, lua)

	-- LSP builder
	if cfg.lsp.name then
		M.lsp_external[cfg.lsp.name] = cfg.lsp.external
		M.lsp_config[cfg.lsp.name] = cfg.lsp.config
	end

	-- plugins
	for _, plug in pairs(cfg.plugins) do
		table.insert(M.plugins, plug)
	end

	-- formatter
	for _, ft in pairs(cfg.formatter.ft or cfg.ft or cfg.name) do
		M.formatter[ft] = cfg.formatter.name
		if cfg.formatter.args then
			M.formatter_args[cfg.formatter.name] = cfg.formatter.args
		end
	end

	for _, ft in pairs(cfg.ft or cfg.name) do
		M.lint[ft] = cfg.lint.name
	end
end

return M
