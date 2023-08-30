return {
	"olimorris/persisted.nvim",
	dependencies = {
		"tiagovla/scope.nvim",
	},
	lazy = false,
	init = function()
		vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
		local group = vim.api.nvim_create_augroup("PersistedHooks", {})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PersistedSavePre",
			group = group,
			callback = function()
				pcall(vim.cmd, "ScopeSaveState")
			end,
		})

		vim.api.nvim_create_autocmd({ "User" }, {
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
	end
}
