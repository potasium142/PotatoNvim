local M = {}

---@param opt_table table
M.load_opt = function(opt_table)
	for key, value in pairs(opt_table) do
		for opt, cfg in pairs(value) do
			vim[key][opt] = cfg
		end
	end
end

---@param path string
---@param callback function
M.run_by_file = function(path, callback)
	local dir_items = vim.fn.readdir(path)

	for _, f in pairs(dir_items) do
		local status, _ = pcall(callback, f)
		if not status then
			print("**Error occur at file [" .. f .. "]**")
		end
	end
end

return M
