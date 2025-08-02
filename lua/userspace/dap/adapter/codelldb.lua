--- @type DapAdapterConfig
return {
	name = "codelldb",
	config = {
		type = "executable",
		command = "codelldb",
		detached = false,
	},
	ft_pattern = { "*.rs", "*.cpp", "*.c" },
}
