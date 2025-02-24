local detection = function()
	return vim.fn.has("wsl") == 1
end
return {
	opts = {
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
	on = detection(),
}
