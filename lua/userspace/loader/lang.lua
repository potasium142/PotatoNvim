local gtils = require("gtils")

local path = vim.fn.stdpath("config") .. "/lua/userspace/lang"

local formatter = {}
local plugs = {}

gtils.run_by_file(path, function(file) end)

return cfg
