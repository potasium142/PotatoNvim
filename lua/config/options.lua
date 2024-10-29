local CONST = require("const.sys_var")
local gtils = require("gtils")

local M = {}
M.opt = {
	guifont = CONST.FONTS,
	tabstop = 4,
	shiftwidth = 4,
	number = true,
	ruler = true,
	cursorline = true,
	showmatch = true,
	autoread = true,
	termguicolors = false,
	updatetime = 100,
	splitbelow = true,
	wildmode = "longest,full",
	smartindent = true,
	autoindent = true,
	signcolumn = "yes",
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
	listchars = {
		tab = "┃ ",
		multispace = "┇   ",
	},
	list = true,
	showmode = false,
}

M.g = {
	loaded_netrwPlugin = 1,
	loaded_netrw = 1,
}

gtils.load_opt(M)

vim.opt.fillchars:append({ fold = " " })
