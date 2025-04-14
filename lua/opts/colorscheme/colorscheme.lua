local sysvar = require("const.sys_var")

local M = {}

M.plugins = {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			-- if sysvar.IS_TTY then
			-- 	vim.cmd.colorscheme("base16-catppuccin")
			-- else
			-- 	vim.cmd.colorscheme("base16-rose-pine-dawn")
			-- end
		end,
	},
	{

		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("everforest").setup({
				-- Your config here
			})
			vim.cmd.colorscheme("everforest")
		end,
	},
}

return M
