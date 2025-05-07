local gtils = require("gtils")

local path = vim.fn.stdpath("config") .. "/lua/userspace/formatter"

local cfg = {}

gtils.run_by_file(path, function(file)
	local f = file:gsub("%.lua$", "")

	--- @type FormatterConfig
	local fmt = require("userspace.formatter." .. f)

	cfg[fmt.name] = fmt.config
end)

return cfg
