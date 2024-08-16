local M = {}

M.load_opt = function(opt_table)
	for key, value in pairs(opt_table) do
		for opt, cfg in pairs(value) do
			vim[key][opt] = cfg
		end
	end
end

---Get hex color from highlight
---@param name string
---@param key string
---@return string
M.get_hl = function(name, key)
	return string.format("#%x", vim.api.nvim_get_hl(0, { name = name, link = false })[key])
end

---Set group hl
---@param prefix string
---@param hls table
M.set_group_hl = function(prefix, hls)
	for name, color in pairs(hls) do
		vim.api.nvim_set_hl(0, prefix .. name, color)
	end
end

return M
