Map("n", "<space>ds", function()
	require("dap").continue()
end)
Map("n", "<space>db", function()
	require("dap").toggle_breakpoint()
end)
Map("n", "<space>dt", function()
	require("dap").terminate()
end)
Map("n", "<F10>", function()
	require("dap").step_over()
end)
Map("n", "<F11>", function()
	require("dap").step_into()
end)
Map("n", "<F12>", function()
	require("dap").step_out()
end)
Map("n", "<space>dc", function()
	require("telescope").extensions.dap.commands({})
end)
Map("n", "<space>dv", function()
	require("telescope").extensions.dap.variables({})
end)
Map("n", "<space>dl", function()
	require("telescope").extensions.dap.list_breakpoints({})
end)
return {
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("dap")
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
			})
		end
	},
	{
		"ldelossa/nvim-dap-projects",
		config = function()
			require("nvim-dap-projects").search_project_config()
		end
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"ldelossa/nvim-dap-projects",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
}
