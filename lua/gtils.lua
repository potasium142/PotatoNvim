local b = require("bit")
local M = {}

M.load_opt = function(opt_table)
	for key, value in pairs(opt_table) do
		for opt, cfg in pairs(value) do
			vim[key][opt] = cfg
		end
	end
end

return M
