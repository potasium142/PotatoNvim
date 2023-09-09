return {
	{
		"ahmedkhalf/project.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("project_nvim").setup()
			require("telescope").load_extension("projects")
		end,
	},
	{
		"tiagovla/scope.nvim",
		lazy = false,

		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("scope")
		end,
		keys = {
			{ "tsb", "<cmd>Telescope scope buffers<cr>" },
		},
	},
	{
		"olimorris/persisted.nvim",
		dependencies = {
			"tiagovla/scope.nvim",
		},
		lazy = false,
		init = function()
			vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
			local group = AutoGroup("PersistedHooks", {})

			AutoCMD({ "User" }, {
				pattern = "PersistedSavePre",
				group = group,
				callback = function()
					pcall(vim.cmd, "ScopeSaveState")
				end,
			})

			AutoCMD({ "User" }, {
				pattern = "PersistedLoadPost",
				group = group,
				callback = function()
					pcall(vim.cmd, "ScopeLoadState")
				end,
			})
		end,
		config = function()
			require("persisted").setup({
				follow_cwd = true,
			})
			require("telescope").load_extension("persisted")
		end,
	},
}
