local gtils = require("gtils")
local path = vim.fn.stdpath("config") .. "/lua/userspace/dap"

local adapters = {}
local config = {}
gtils.run_by_file(path .. "/adapter", function(file)
	local f = file:gsub("%.lua$", "")

	---@type DapAdapterConfig
	local adapter_config = require("userspace.dap.adapter." .. f)

	adapters[adapter_config.name] = {
		pattern = adapter_config.ft_pattern,
		config = adapter_config.config,
	}
end)

gtils.run_by_file(path .. "/lang", function(file)
	local f = file:gsub("%.lua$", "")

	---@type DapConfig
	local lang_config = require("userspace.dap.lang." .. f)

	config[lang_config.name] = {
		config = lang_config.config,
		pattern = lang_config.ft_pattern,
	}
end)

return {
	adapter = adapters,
	lang = config,
}
