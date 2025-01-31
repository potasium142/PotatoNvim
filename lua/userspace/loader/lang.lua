local gtils = require("gtils")

local path = vim.fn.stdpath("config") .. "/lua/userspace/lang"

local formatters = {}
local plugs = {}
local maps_ft = {}

gtils.run_by_file(path, function(file)
	local f = file:gsub("%.lua$", "")
	local cfg = require("userspace.lang." .. f)

	local map_ft = {}

	local local_plugin = cfg.plugin or {}
	local local_map_ft = cfg.map_ft or {}

	for _, ft in ipairs(local_map_ft) do
		map_ft[ft] = cfg.default_ft
	end
	maps_ft = vim.tbl_deep_extend("error", maps_ft, map_ft or {})

	formatters[cfg.ft] = cfg.formatter or {}

	for _, plug in pairs(local_plugin) do
		table.insert(plugs, plug)
	end
end)

vim.filetype.add({
	extension = maps_ft,
})

return {
	formatters = formatters,
	plugs = plugs,
}
