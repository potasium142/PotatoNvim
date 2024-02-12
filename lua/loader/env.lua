local path = vim.fn.stdpath("config") .. "/lua/environments"
local env_list = vim.fn.readdir(path)

for _, e in pairs(env_list) do
	local env = e:gsub("%.lua$", "")

	if vim.fn.has(env) == 0 then
		goto continue
	end

	print(env)

	local cfg = require("environments." .. env)

	for opt, c in pairs(cfg) do
		for key, value in pairs(c) do
			vim[opt][key] = value
		end
	end

	::continue::
end
