local env_list = require("loader.env_list")

local missing_env = ""

for env, exist in pairs(env_list) do
	if exist then
		if not pcall(function()
			require("opts.environments." .. env)
		end) then
			missing_env = missing_env .. env
		end
	end
end

if #missing_env ~= 0 then
	vim.notify_once("{" .. missing_env .. "} detected but no configuration found")
end
