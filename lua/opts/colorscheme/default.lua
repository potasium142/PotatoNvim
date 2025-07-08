local WIN32 = vim.fn.has("win32")
local IS_TTY = (os.getenv("DISPLAY") == nil) and (WIN32 == 0)

return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	opts = {
		dim_inactive_windows = false,
		diagnostic_text_highlight = true,
		inlay_hints_background = "dim",
	},
	config = function(_, opts)
		if IS_TTY then
			vim.cmd.colorscheme("default")
			vim.opt.termguicolors = false
			return
		end

		local everforest = require("everforest")

		everforest.setup(opts)
		everforest.load()
	end,
}
