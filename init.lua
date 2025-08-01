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

local is_tty = require("env").IS_TTY

if is_tty then
	vim.cmd.colorscheme("default")
else
	vim.cmd.colorscheme("retrobox")
end

local lg_plugins = require("loader.lang").plugs

local colorscheme = require("opts.colorscheme.default")

local user_colorscheme = require("userspace.colorscheme")

if type(user_colorscheme) == "table" then
	colorscheme = user_colorscheme
end

local icon = require("const.icons_text")

require("config.options")
require("config.mapping")
require("scripts.tabout")

require("loader.env")

require("autocmd")

require("lazy").setup({
	defaults = {
		lazy = false,
	},
	ui = {
		icons = icon.lazy,
	},
	checker = {
		enabled = true,
	},
	spec = {
		colorscheme,
		{ import = "plugins.cores" },
		{ import = "plugins.ui" },
		{ import = "plugins.buffers" },
		{ import = "plugins.utils" },
		{ import = "plugins.split" },
		{ import = "plugins.cmp" },
		lg_plugins,
	},
	performance = {
		rtp = {
			reset = false, -- reset the runtime path to $VIMRUNTIME and your config directory
		},
	},
})

require("loader.lsp")
