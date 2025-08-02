local pick_file = require("userspace.dap.picker").dap_pickfile

---@type DapConfig
return {
	name = "rust",
	ft_pattern = { "*.rs" },
	config = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = pick_file(),
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	},
}
