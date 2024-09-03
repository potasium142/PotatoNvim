local M = {
	external = {},
	automatic = {},
}

local path = vim.fn.stdpath("config") .. "/lua/opts/lsp"

local lsp_configs = vim.fn.readdir(path)

for _, l in pairs(lsp_configs) do
	local f = l:gsub("%.lua$", "")
	local lsp = require("opts.lsp." .. f)

	if lsp.external then
		M.external[lsp.name] = lsp.config
	else
		M.automatic[lsp.name] = lsp.config
	end
end

return M
