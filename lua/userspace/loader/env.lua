local gtils = require("gtils")

local path = vim.fn.stdpath("config") .. "/lua/userspace/env"

gtils.run_by_file(path, function(env)
	local f = env:gsub("%.lua$", "")
	local env_cfg = require("userspace.env." .. f)

	if env_cfg.on then
		gtils.load_opt(env_cfg.opts)

		if env_cfg.callback then
			env_cfg.callback(env)
		end
	end
end)
