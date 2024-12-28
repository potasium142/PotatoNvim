return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	enabled = false,
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
	name = "project_nvim",
	cmd = {
		"Telescope projects",
	},
}
