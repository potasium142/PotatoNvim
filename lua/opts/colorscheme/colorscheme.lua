local sysvar = require("const.sys_var")

local M = {}

M.plugins = {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			-- if sysvar.IS_TTY then
			-- 	vim.cmd.colorscheme("base16-rose-pine-dawn")
			-- end
		end,
	},
	{

		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		enabled = true,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("everforest").setup({
				-- Your config here
			})
			if not sysvar.IS_TTY then
				vim.cmd.colorscheme("everforest")
			end
		end,
	},
}

return M
