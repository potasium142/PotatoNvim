return {
	{
		"nvim-telescope/telescope-dap.nvim",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
			})
		end,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			require("persistent-breakpoints").setup({
				load_breakpoints_event = { "BufReadPost" },
			})
		end,
	},
	{
		"ldelossa/nvim-dap-projects",

		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("nvim-dap-projects").search_project_config()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		lazy = true,
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
