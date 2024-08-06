local path = vim.fn.stdpath("config") .. "/lua/opts/formatters"

local formatters_arg = vim.fn.readdir(path)

local cfg = {}

for _, l in pairs(formatters_arg) do
	local f = l:gsub("%.lua$", "")
	local fmt = require("opts.formatters." .. f)

	cfg[fmt.name] = fmt.config
end

return cfg
