local gtils = require("gtils")
local M = {}

M.g = {
	clipboard = {
		name = "wslclip",
		copy = {
			["+"] = "wslclip",
			["*"] = "wslclip",
		},
		paste = {
			["+"] = "wslclip -g",
			["*"] = "wslclip -g",
		},
		cache_enable = 0,
	},
}

gtils.load_opt(M)
