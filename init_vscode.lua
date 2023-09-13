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
Shell = "fish"

require("config.options")
require("config.mapping")
require("lazy").setup({
	defaults = {
		lazy = false,
	},
	spec = {
		{ import = "plugins.buffers" },
		{ import = "plugins.utils.auto_save" },
		{ import = "languages" },
	},
})
