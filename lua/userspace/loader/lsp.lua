local gtils = require("gtils")
local path = vim.fn.stdpath("config") .. "/lua/userspace/lsp"

local lsp = {}

gtils.run_by_file(path, function(file)
	local f = file:gsub("%.lua$", "")
	local lsp_config = require("userspace.lsp." .. f)

	lsp[lsp_config.name] = lsp_config.config
end)

return lsp
