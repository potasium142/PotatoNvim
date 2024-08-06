local CONST = require("CONST")

local has = function(env)
	return vim.fn.has(env) == 1
end

local env_table = {
	neovide = vim.g.neovide,
	win32 = CONST.WIN32,
	wsl = has('wsl'),
	gui = has('gui-running')
}

return env_table