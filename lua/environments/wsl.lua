local M = {}

M.g = {
	clipboard = {
		name = "wslclip",
		copy = {
			["+"] = "wslclip",
			["*"] = "wslclip"
		},
		paste = {
			["+"] = "wslclip -g",
			["*"] = "wslclip -g"
		},
		cache_enable = 0,
	}
}

return M
