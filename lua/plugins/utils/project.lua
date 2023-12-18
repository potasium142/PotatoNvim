return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	opts = function()
		return {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		}
	end,
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
	cmd = {
		"Telescope projects",
	},
}
