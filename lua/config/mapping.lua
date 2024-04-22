local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local CONST = require("CONST")

local term_command = function()
	if CONST.WIN32 then
	else
	end
end
local open_terminal_session = function()
	if not pcall(function()
		term_command()
	end) then
		vim.api.nvim_echo({ { "Cannot spawn external terminal", "error" } }, true, {})
	end
end

--Tabbing
map("n", ">", ":><cr>", opts)
map("n", "<", ":<<cr>", opts)

--Visual tabbing
map("v", ">", ":><cr>gv", opts)
map("v", "<", ":<<cr>gv", opts)

--Disable arrow
map("n", "<Up>", "<nop>", opts)
map("n", "<Down>", "<nop>", opts)
map("n", "<Right>", "<nop>", opts)
map("n", "<Left>", "<nop>", opts)

--Globle buffer paste
map("n", "gp", '"+p<CR>', opts)
map({ "v", "n" }, "gy", '"+y<CR>', opts)

map("n", "<CR>", ":noh<cr><cr>", opts)

--Save
map("n", "<Space>w", "<cmd>:w<cr>")
map("n", "<Space>W", "<cmd>:wa<cr>")

--Delete
map({ "n", "v" }, "x", '"_x', opts)

--Half buffer jump
map({ "n", "v" }, "<C-j>", "<C-d>zz")
map({ "n", "v" }, "<C-k>", "<C-u>zz")

map({ "i", "n" }, "<F1>", "<nop>", opts)
map("n", "<C-\\>", function()
	open_terminal_session()
end)
