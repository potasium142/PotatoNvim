local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

Opts = { noremap = true, silent = true }
BufOpts = { noremap = true, silent = true, buffer = bufnr }
G = vim.g
Set = vim.o
HL = vim.api.nvim_set_hl
AutoCMD = vim.api.nvim_create_autocmd
AutoGroup = vim.api.nvim_create_augroup

require("config.options")
require("config.env")
require("config.mapping")
require("lazy").setup({
	defaults = {
		lazy = false,
	},
	checker = {
		enabled = true,
	},
	spec = {
		{ import = "plugins.cores" },
		{ import = "plugins.ui" },
		{ import = "plugins.buffers" },
		{ import = "plugins.utils" },
		{ import = "plugins.split" },
		{ import = "plugins.dap" },
		{ import = "plugins.cmp.cmp" },
		{ import = "languages" },
	},
})
