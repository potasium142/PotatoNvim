return {
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("telescope").load_extension("dap")
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
			})
		end
	},
	{
		"ldelossa/nvim-dap-projects",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("nvim-dap-projects").search_project_config()
		end
	},
	{
		"mfussenegger/nvim-dap",
		keys = {

			{ "<space>ds", function()
				require("dap").continue()
			end },
			{ "<space>db", function()
				require("dap").toggle_breakpoint()
			end },
			{ "<space>dt", function()
				require("dap").terminate()
			end },
			{ "<F10>", function()
				require("dap").step_over()
			end },
			{ "<F11>", function()
				require("dap").step_into()
			end },
			{ "<F12>", function()
				require("dap").step_out()
			end },
			{ "<space>dc", function()
				require("telescope").extensions.dap.commands({})
			end },
			{ "<space>dv", function()
				require("telescope").extensions.dap.variables({})
			end },
			{ "<space>dl", function()
				require("telescope").extensions.dap.list_breakpoints({})
			end },
		}
	},
}
