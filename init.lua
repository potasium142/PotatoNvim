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
AutoCMD = vim.api.nvim_create_autocmd
AutoGroup = vim.api.nvim_create_augroup

local lg_plugins = require("loader.language").plugins
require("loader.env")
require("config.options")
require("config.mapping")
require("custom_script.tabout")
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
		{ import = "plugins.cmp" },
		{ import = "plugins.remote" },
		lg_plugins,
	},
	performance = {
		rtp = {
			reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory
		},
	},
})
