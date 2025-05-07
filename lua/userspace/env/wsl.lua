local detection = function()
	return vim.fn.has("wsl") == 1
end
--- @type EnvConfig
return {
	opt = {
		g = {
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
		},
	},
	detection = detection(),
}
