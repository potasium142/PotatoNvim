local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--Tabbing
map("n", ">", ":><cr>", opts)
map("n", "<", ":<<cr>", opts)

--Visual tabbing
map("v", ">", ":><cr>gv", opts)
map("v", "<", ":<<cr>gv", opts)

--Globle buffer paste
map({ "v", "n" }, "\\", '"+', opts)
--Void regsiter
map({ "n", "v" }, "<BS>", '"_', opts)

map("n", "<CR>", ":noh<cr><cr>", opts)

--Save
map("n", "<Space>w", "<cmd>:w<cr>")
map("n", "<Space>W", "<cmd>:wa<cr>")

--Half buffer jump
map({ "n", "v" }, "<C-j>", "<C-d>zz")
map({ "n", "v" }, "<C-k>", "<C-u>zz")

map({ "i", "n" }, "<F1>", "<nop>", opts)

map("n", "<space>dd", function()
	vim.api.nvim_buf_delete(0, {})
end, opts)
