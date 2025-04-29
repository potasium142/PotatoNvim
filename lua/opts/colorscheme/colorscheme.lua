local sysvar = require("const.sys_var")

local M = {}

M.plugins = {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			if not sysvar.IS_TTY then
				vim.cmd.colorscheme("base16-gruvbox-material-light-soft")
				vim.opt.termguicolors = true
			end
		end,
	},
}

return M
