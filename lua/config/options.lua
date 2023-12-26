local options = {
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
	signcolumn = "yes",
	ffs = "unix,dos",
	swapfile = false,
	mouse = "",
	relativenumber = true,
	guicursor = "i-ci:ver10",
	scrolloff = 7,
	foldenable = true,
	foldmethod = "indent",
	foldlevelstart = 69,
	laststatus = 3,
	listchars = {
		tab = "┃ ",
		multispace = "┇ ",
	},
	list = true,
	showmode = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

local flags = {
	loaded_netrwPlugin = 1,
	loaded_netrw = 1,
}

for k, v in pairs(flags) do
	vim.g[k] = v
end
