local CONST = require("const.sys_var")
local gtils = require("gtils")

local M = {}
M.opt = {
	guifont = CONST.FONTS,
	background = "light",
	tabstop = 4,
	shiftwidth = 4,
	number = true,
	ruler = true,
	cursorline = true,
	showmatch = true,
	autoread = true,
	termguicolors = true,
	updatetime = 100,
	splitbelow = true,
	wildmode = "longest,full",
	smartindent = true,
	autoindent = true,
	signcolumn = "yes:2",
	ffs = "unix,dos",
	swapfile = false,
	mouse = "",
	relativenumber = true,
	guicursor = "i-ci:ver10",
	scrolloff = 7,
	foldenable = true,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 69,
	laststatus = 3,
	-- listchars = {
	-- 	tab = "🭰 ",
	-- 	multispace = "🭰 ┊ ",
	-- },
	list = false,
	showmode = false,
	cmdheight = 1,
}

M.g = {
	loaded_netrwPlugin = 1,
	loaded_netrw = 1,
	mapleader = " ",
}

gtils.load_opt(M)

vim.opt.fillchars:append({ fold = " " })
vim.opt.formatoptions:remove({ "c", "r", "o" })
