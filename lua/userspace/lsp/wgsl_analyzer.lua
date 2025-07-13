---@type LspConfig
return {
	name = "wgsl-analyzer",
	ft_pattern = { "*.wgsl", "*.wesl" },
	config = {
		cmd = {
			"wgsl-analyzer",
		},
	},
}
