Map = vim.keymap.set

--Tabbing
Map("n", ">", ":><cr>", Opts)
Map("n", "<", ":<<cr>", Opts)

--Visual tabbing
Map("v", ">", ":><cr>gv", Opts)
Map("v", "<", ":<<cr>gv", Opts)

--Disable arrow
Map("n", "<Up>", "<nop>", Opts)
Map("n", "<Down>", "<nop>", Opts)
Map("n", "<Right>", "<nop>", Opts)
Map("n", "<Left>", "<nop>", Opts)

--Globle buffer paste
Map("n", "gp", '"+p<CR>', Opts)
Map("n", "gjp", "<cmd>pu+<CR>", Opts)
Map("n", "gkp", "<cmd>pu!+<CR>", Opts)
Map({ "v", "n" }, "gy", '"+y<CR>', Opts)

Map("n", "<CR>", ":noh<cr><cr>", Opts)

--Save
Map("n", "<Space>w", "<cmd>:w<cr>")

--Delete
Map({ "n", "v" }, "x", '"_x', Opts)

--Half buffer jump
Map({ "n", "v" }, "<C-j>", "<C-d>zz")
Map({ "n", "v" }, "<C-k>", "<C-u>zz")

Map({ "n", "v" }, "q", "b")
Map({ "n", "v" }, "Q", "B")

Map({ "i", "n" }, "<F1>", "<nop>", Opts)
Map("n", "<space>tq", "<cmd>tabclose<cr>")
Map("n", "<space>tn", "<cmd>tabnew<cr>")
Map("n", "]t", "<cmd>tabnext<cr>", Opts)
Map("n", "[t", "<cmd>tabprevious<cr>", Opts)
