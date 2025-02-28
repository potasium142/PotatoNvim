local gtils = require("gtils")
local sysvar = require("const.sys_var")
local set_hl = vim.api.nvim_set_hl

local M = {}

M.plugins = {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require("base16-colorscheme").with_config({
				telescope = true,
				indentblankline = true,
				notify = true,
				ts_rainbow = true,
				cmp = true,
				illuminate = true,
				dapui = true,
			})

			if sysvar.IS_TTY then
			else
				vim.cmd.colorscheme("base16-gruvbox-light-medium")
			end
		end,
	},
}

return M
