return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
		},
		keys = {
			{
				"<space>ds",
				function()
					require("dap").continue()
				end,
			},
			{
				"<space>db",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<space>dt",
				function()
					require("dap").terminate()
				end,
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
			},
			{
				"<space>dc",
				function()
					require("telescope").extensions.dap.commands({})
				end,
			},
			{
				"<space>dv",
				function()
					require("telescope").extensions.dap.variables({})
				end,
			},
			{
				"<space>dl",
				function()
					require("telescope").extensions.dap.list_breakpoints({})
				end,
			},
		},
	},
}
